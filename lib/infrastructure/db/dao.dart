import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import "package:smart_order_app/infrastructure/db/dto/reason.dart";
import 'package:smart_order_app/infrastructure/db/dto/scene.dart';
import 'package:smart_order_app/util/date.dart';
import 'package:sqflite/sqflite.dart';

class DAO implements Repository {
  final Database db;

  DAO({required this.db});

  String _getNow() {
    return formatFromDateTime(DateTime.now(), DateFormatType.dbFormat);
  }

  Future<int> _add(String table, Map<String, Object?> values) async {
    final now = _getNow();
    values.remove("id");
    values.addAll({"created_at": now, "updated_at": now});
    return await db.insert(
      table,
      values,
    );
  }

  Map<String, Object?> _getUpdateValues(Map<String, Object?> values) {
    final now = _getNow();
    values.remove("created_at");
    values.addAll({"updated_at": now});
    return values;
  }

  Future<int> _update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    return await db.update(
      table,
      _getUpdateValues(values),
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> _updateById(String table, Map<String, Object?> values,
      {required Id id}) async {
    return await _update(
      table,
      values,
      where: "id = ?",
      whereArgs: [id.value],
    );
  }

  Future<int> _deleteById(String table, {required Id id}) async {
    return await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id.value],
    );
  }

  @override
  Future<List<Scene>> getScenesAndPhrases() async {
    final List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT
      s.id as scene_id,
      s.scene,
      s.is_default,
      s.created_at as scene_created_at,
      s.updated_at as scene_updated_at,
      p.id as phrase_id,
      p.phrase,
      p.created_at as phrase_created_at,
      p.updated_at as phrase_updated_at
    FROM scenes s
    LEFT JOIN scenes_phrases sp ON s.id = sp.scene_id
    LEFT JOIN phrases p ON sp.phrase_id = p.id
    ''');

    Map<int, Map<String, dynamic>> scenesMap = {};
    for (var row in result) {
      final sceneId = row['scene_id'] as int;
      if (!scenesMap.containsKey(sceneId)) {
        scenesMap[sceneId] = {
          'id': sceneId,
          'scene': row['scene'],
          'phrases': [],
          'is_default': row['is_default'],
          'created_at': row['scene_created_at'],
          'updated_at': row['scene_updated_at'],
        };
      }

      if (row['phrase_id'] != null) {
        final phraseMap = {
          'id': row['phrase_id'],
          'phrase': row['phrase'],
          'created_at': row['phrase_created_at'],
          'updated_at': row['phrase_updated_at'],
        };
        scenesMap[sceneId]?['phrases'].add(phraseMap);
      }
    }

    final scenesDTOs = scenesMap.values
        .map((sceneMap) => SceneDTO.fromJson(sceneMap))
        .toList();
    return scenesDTOs.map((dto) => dto.toEntity()).toList();
  }

  // TODO: トランザクション
  @override
  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    try {
      final phraseId = await _add(
        "phrases",
        {
          "phrase": phrase,
        },
      );
      for (final scene in scenes) {
        await _add(
          "scenes_phrases",
          {
            "scene_id": scene.id.value,
            "phrase_id": phraseId,
          },
        );
      }
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.phraseDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> updatePhrase(Phrase phrase,
      {required List<Scene> deletedScenes,
      required List<Scene> addedScenes}) async {
    try {
      await _updateById(
        "phrases",
        {
          "phrase": phrase.phrase,
        },
        id: phrase.id,
      );
      for (final scene in deletedScenes) {
        await db.delete(
          'scenes_phrases',
          where: "scene_id = ? AND phrase_id = ?",
          whereArgs: [scene.id.value, phrase.id.value],
        );
      }
      for (final scene in addedScenes) {
        await _add(
          "scenes_phrases",
          {
            "scene_id": scene.id.value,
            "phrase_id": phrase.id.value,
          },
        );
      }
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.phraseDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> deletePhrase(Phrase phrase) async {
    await _deleteById("phrases", id: phrase.id);
  }

  // TODO: デフォルトを一番上にする
  @override
  Future<List<Reason>> getReasonList() async {
    List<Map<String, dynamic>> results = await db.query("reasons");
    return results.map((r) => ReasonDTO.fromJson(r).toEntity()).toList();
  }

  // TODO: 既にデフォルトがある場合はデフォルトを追加できないようにする
  @override
  Future<void> addReason(String reason, bool isDefault) async {
    try {
      await _add(
        "reasons",
        {"reason": reason, "is_default": isDefault ? 1 : 0},
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.reasonDuplicate);
      }
      rethrow;
    }
  }

  // TODO: 既にデフォルトがある場合はデフォルトに変更できないようにする
  @override
  Future<void> updateReason(Reason reason) async {
    try {
      await _updateById(
        "reasons",
        {"reason": reason.reason, "is_default": reason.isDefault ? 1 : 0},
        id: reason.id,
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.reasonDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteReason(Reason reason) async {
    await _deleteById("reasons", id: reason.id);
  }

  @override
  Future<void> addScene(String scene) async {
    try {
      await _add(
        "scenes",
        {
          "scene": scene,
        },
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.sceneDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> updateScene(Scene scene) async {
    try {
      await _updateById(
        "scenes",
        {
          "scene": scene.scene,
        },
        id: scene.id,
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.sceneDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteScene(Scene scene) async {
    await _deleteById("scenes", id: scene.id);
  }
}
