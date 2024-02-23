import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) =>
    throw UnimplementedError('Provider was not initialized');

abstract interface class Repository {
  Future<List<Scene>> getScenesAndPhrases();

  Future<void> addPhrase(String phrase, List<Scene> scenes);
  Future<void> updatePhrase(Phrase phrase);
  Future<void> deletePhrase(Phrase phrase);

  Future<List<Reason>> getReasonList();
  Future<void> addReason(String reason, bool isDefault);
  Future<void> updateReason(Reason reason);
  Future<void> deleteReason(Reason reason);

  Future<void> addScene(String scene);
  Future<void> updateScene(Scene scene);
  Future<void> deleteScene(Scene scene);
}
