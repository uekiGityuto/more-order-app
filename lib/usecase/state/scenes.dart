import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/repository/repository.dart';

part 'scenes.g.dart';

@Riverpod(keepAlive: true)
class ScenesNotifier extends _$ScenesNotifier {
  @override
  Future<List<Scene>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.getScenesAndPhrases();
  }

  Future<void> updateState() async {
    state = AsyncValue.data(await build());
  }

  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    final repository = ref.read(repositoryProvider);
    await repository.addPhrase(phrase, scenes);
    await updateState();
  }

  Future<void> editPhrase(Phrase phrase,
      {required List<Scene> prevScenes,
      required List<Scene> nextScenes}) async {
    final deletedScenes = prevScenes
        .where((prevScene) => !nextScenes.contains(prevScene))
        .toList();
    final addedScenes = nextScenes
        .where((nextScene) => !prevScenes.contains(nextScene))
        .toList();
    final repository = ref.read(repositoryProvider);
    await repository.updatePhrase(phrase,
        deletedScenes: deletedScenes, addedScenes: addedScenes);
    await updateState();
  }

  Future<void> deletePhrase(Phrase phrase) async {
    final repository = ref.read(repositoryProvider);
    await repository.deletePhrase(phrase);
    await updateState();
  }

  Future<void> addScene(String scene) async {
    final repository = ref.read(repositoryProvider);
    await repository.addScene(scene);
    await updateState();
  }
}
