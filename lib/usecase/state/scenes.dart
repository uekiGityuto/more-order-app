import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/usecase/result.dart';
import 'package:smart_order_app/usecase/state/error.dart';

part 'scenes.g.dart';

@Riverpod(keepAlive: true)
class ScenesNotifier extends _$ScenesNotifier {
  @override
  Future<List<Scene>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.getScenesAndPhrases();
  }

  _notifyError(ErrorType errorType) {
    ref.read(errorNotifierProvider.notifier).updateState(errorType);
  }

  Future<void> updateState() async {
    state = AsyncValue.data(await build());
  }

  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    final repository = ref.read(repositoryProvider);
    await repository.addPhrase(phrase, scenes);
    await updateState();
  }

  Future<Result> addScene(String scene) async {
    final repository = ref.read(repositoryProvider);
    await repository.addScene(scene);
    await updateState();
    return Result.success;
  }
}
