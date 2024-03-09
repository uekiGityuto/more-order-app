import 'package:smart_order_app/domain/entity/payment_method.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/infrastructure/db/dto/payment_method.dart';
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

  Future<int> _add(
    String table,
    Map<String, Object?> values, {
    Transaction? txn,
  }) async {
    final now = _getNow();
    values.remove("id");
    values.addAll({"created_at": now, "updated_at": now});
    final database = txn ?? db;
    return await database.insert(
      table,
      values,
    );
  }

  Future<int> _update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
    Transaction? txn,
  }) async {
    final now = _getNow();
    values.remove("created_at");
    values.addAll({"updated_at": now});
    final database = txn ?? db;
    return await database.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> _updateById(
    String table,
    Map<String, Object?> values, {
    required Id id,
    Transaction? txn,
  }) async {
    return await _update(
      table,
      values,
      where: "id = ?",
      whereArgs: [id.value],
      txn: txn,
    );
  }

  Future<int> _updateDefaultFalseById(
    String table, {
    required Id id,
    required Transaction txn,
  }) async {
    return await _updateById(
      table,
      {"is_default": 0},
      id: id,
      txn: txn,
    );
  }

  Future<int> _deleteById(
    String table, {
    required Id id,
    Transaction? txn,
  }) async {
    final database = txn ?? db;
    return await database.delete(
      table,
      where: "id = ?",
      whereArgs: [id.value],
    );
  }

  Future<int> _getRowCount(
    String table, {
    Transaction? txn,
  }) async {
    final database = txn ?? db;
    final data = await database.rawQuery('SELECT COUNT(*) FROM $table');
    // rawQueryはList<Map<String, dynamic>>を返すので、最初の行の最初のカラムの値をintとして取得
    int count = Sqflite.firstIntValue(data) ?? 0;
    return count;
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

  @override
  Future<int> countPhrases() async {
    return await _getRowCount("phrases");
  }

  @override
  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    try {
      await db.transaction(
        (txn) async {
          final phraseId = await _add(
            "phrases",
            {
              "phrase": phrase,
            },
            txn: txn,
          );
          for (final scene in scenes) {
            await _add(
              "scenes_phrases",
              {
                "scene_id": scene.id.value,
                "phrase_id": phraseId,
              },
              txn: txn,
            );
          }
        },
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.phraseDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> updatePhrase(
    Phrase phrase, {
    required List<Scene> deletedScenes,
    required List<Scene> addedScenes,
  }) async {
    try {
      await db.transaction(
        (txn) async {
          await _updateById(
            "phrases",
            {
              "phrase": phrase.phrase,
            },
            id: phrase.id,
            txn: txn,
          );
          for (final scene in deletedScenes) {
            await txn.delete(
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
              txn: txn,
            );
          }
        },
      );
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

  @override
  Future<List<Reason>> getReasons() async {
    List<Map<String, dynamic>> result =
        await db.query("reasons", orderBy: "is_default DESC");
    return result.map((r) => ReasonDTO.fromJson(r).toEntity()).toList();
  }

  Future<void> _updateExistingDefaultReasonToFalse(Transaction txn) async {
    List<Map<String, dynamic>> result = await txn.query(
      "reasons",
      where: "is_default = ?",
      whereArgs: [1],
    );
    if (result.isEmpty) {
      return;
    } else {
      await _updateDefaultFalseById(
        "reasons",
        id: ReasonDTO.fromJson(result.first).toEntity().id,
        txn: txn,
      );
    }
  }

  @override
  Future<int> countReasons() async {
    return await _getRowCount("reasons");
  }

  @override
  Future<void> addReason(String reason, bool isDefault) async {
    try {
      await db.transaction(
        (txn) async {
          if (isDefault) {
            await _updateExistingDefaultReasonToFalse(txn);
          }
          await _add(
            "reasons",
            {"reason": reason, "is_default": isDefault ? 1 : 0},
            txn: txn,
          );
        },
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.reasonDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> updateReason(Reason reason) async {
    try {
      await db.transaction(
        (txn) async {
          if (reason.isDefault) {
            await _updateExistingDefaultReasonToFalse(txn);
          }
          await _updateById(
            "reasons",
            {"reason": reason.reason, "is_default": reason.isDefault ? 1 : 0},
            id: reason.id,
            txn: txn,
          );
        },
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
  Future<int> countScenes() async {
    return await _getRowCount("scenes");
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

  Future<void> _updateExistingDefaultPaymentMethodToFalse(
      Transaction txn) async {
    List<Map<String, dynamic>> result = await txn.query(
      "payment_methods",
      where: "is_default = ?",
      whereArgs: [1],
    );
    if (result.isEmpty) {
      return;
    } else {
      await _updateDefaultFalseById(
        "payment_methods",
        id: PaymentMethodDTO.fromJson(result.first).toEntity().id,
        txn: txn,
      );
    }
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    List<Map<String, dynamic>> result =
        await db.query("payment_methods", orderBy: "is_default DESC");
    return result.map((r) => PaymentMethodDTO.fromJson(r).toEntity()).toList();
  }

  @override
  Future<int> countPaymentMethods() async {
    return await _getRowCount("payment_methods");
  }

  @override
  Future<void> addPaymentMethod(String method, bool isDefault) async {
    try {
      await db.transaction(
        (txn) async {
          if (isDefault) {
            await _updateExistingDefaultPaymentMethodToFalse(txn);
          }
          await _add(
            "payment_methods",
            {"method": method, "is_default": isDefault ? 1 : 0},
            txn: txn,
          );
        },
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.paymentMethodDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> updatePaymentMethod(PaymentMethod paymentMethod) async {
    try {
      await db.transaction(
        (txn) async {
          if (paymentMethod.isDefault) {
            await _updateExistingDefaultPaymentMethodToFalse(txn);
          }
          await _updateById(
            "payment_methods",
            {
              "method": paymentMethod.method,
              "is_default": paymentMethod.isDefault ? 1 : 0
            },
            id: paymentMethod.id,
            txn: txn,
          );
        },
      );
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        throw const DomainException(ErrorType.paymentMethodDuplicate);
      }
      rethrow;
    }
  }

  @override
  Future<void> deletePaymentMethod(PaymentMethod paymentMethod) async {
    await _deleteById("payment_methods", id: paymentMethod.id);
  }
}
