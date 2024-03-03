import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/repository/repository.dart';

part 'reasons.g.dart';

@Riverpod(keepAlive: true)
class ReasonsNotifier extends _$ReasonsNotifier {
  @override
  Future<List<Reason>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.getReasons();
  }

  Future<void> updateState() async {
    state = AsyncValue.data(await build());
  }

  Future<void> addReason(String reason, bool isDefault) async {
    final repository = ref.read(repositoryProvider);
    await repository.addReason(reason, isDefault);
    await updateState();
  }

  Future<void> editReason(Reason reason) async {
    final repository = ref.read(repositoryProvider);
    await repository.updateReason(reason);
    await updateState();
  }

  Future<void> deleteReason(Reason reason) async {
    final repository = ref.read(repositoryProvider);
    await repository.deleteReason(reason);
    await updateState();
  }
}