import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/repository/repository.dart';

class FakeRepository implements Repository {
  final List<Scene> scenes;
  final List<Reason> reasons;
  FakeRepository({this.scenes = const [], this.reasons = const []});

  @override
  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> addReason(String reason, bool isDefault) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> addScene(String scene) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deletePhrase(Phrase phrase) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deleteReason(Reason reason) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deleteScene(Scene scene) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<List<Reason>> getReasonList() async {
    return reasons;
  }

  @override
  Future<List<Scene>> getScenesAndPhrases() async {
    return scenes;
  }

  @override
  Future<void> updatePhrase(Phrase phrase,
      {required List<Scene> deletedScenes,
      required List<Scene> addedScenes}) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updateReason(Reason reason) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updateScene(Scene scene) async {
    await Future.delayed(const Duration(seconds: 0));
  }
}
