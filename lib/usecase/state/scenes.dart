import 'package:more_order_app/domain/entity/phrase.dart';
import 'package:more_order_app/domain/entity/scene.dart';
import 'package:more_order_app/domain/errors/error.dart';
import 'package:more_order_app/domain/errors/max_add_count.dart';
import 'package:more_order_app/domain/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scenes.g.dart';

@Riverpod(keepAlive: true)
class ScenesNotifier extends _$ScenesNotifier {
  @override
  Future<List<Scene>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.fetchScenesAndPhrases();
  }

  Future<void> updateState() async {
    state = AsyncValue.data(await build());
  }

  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    final repository = ref.read(repositoryProvider);
    final count = await repository.countPhrases();
    if (MaxAddCount.phrase.isOver(count)) {
      throw const DomainException(ErrorType.phraseCountOver);
    }
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
    final count = await repository.countScenes();
    if (MaxAddCount.scene.isOver(count)) {
      throw const DomainException(ErrorType.sceneCountOver);
    }
    await repository.addScene(scene);
    await updateState();
  }

  Future<void> editScene(Scene scene) async {
    if (scene.isDefault) {
      throw const DomainException(ErrorType.defaultSceneEdit);
    }
    final repository = ref.read(repositoryProvider);
    await repository.updateScene(scene);
    await updateState();
  }

  Future<void> deleteScene(Scene scene) async {
    if (scene.isDefault) {
      throw const DomainException(ErrorType.defaultSceneDelete);
    }
    final repository = ref.read(repositoryProvider);
    await repository.deleteScene(scene);
    await updateState();
  }
}
