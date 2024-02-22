import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/errors/error.dart';
import 'package:smart_order_app/domain/repository/repository.dart';
import 'package:smart_order_app/usecase/result.dart';
import 'package:smart_order_app/usecase/state/error.dart';

part 'scenes.g.dart';

@riverpod
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

  Future<void> getScenes() async {
    try {
      state = AsyncValue.data(await build());
    } on DomainException catch (e) {
      _notifyError(e.type);
    } catch (_) {
      _notifyError(ErrorType.unexpected);
    }
  }

  Future<Result> addPhrase(String phrase, Scene scene) async {
    final repository = ref.read(repositoryProvider);
    try {
      await repository.addPhrase(phrase, scene);
      await getScenes();
      return Result.success;
    } on DomainException catch (e) {
      _notifyError(e.type);
      return Result.failed;
    } catch (e) {
      _notifyError(ErrorType.unexpected);
      return Result.failed;
    }
  }
}
