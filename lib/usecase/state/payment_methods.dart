import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/payment_method.dart';
import 'package:smart_order_app/domain/repository/repository.dart';

part 'payment_methods.g.dart';

@Riverpod(keepAlive: true)
class PaymentMethodsNotifier extends _$PaymentMethodsNotifier {
  @override
  Future<List<PaymentMethod>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.getPaymentMethods();
  }

  Future<void> updateState() async {
    state = AsyncValue.data(await build());
  }

  Future<void> addPaymentMethod(String method, bool isDefault) async {
    final repository = ref.read(repositoryProvider);
    await repository.addMethod(method, isDefault);
    await updateState();
  }

  Future<void> editPaymentMethod(PaymentMethod paymentMethod) async {
    final repository = ref.read(repositoryProvider);
    await repository.updatePaymentMethod(paymentMethod);
    await updateState();
  }

  Future<void> deletePaymentMethod(PaymentMethod paymentMethod) async {
    final repository = ref.read(repositoryProvider);
    await repository.deletePaymentMethod(paymentMethod);
    await updateState();
  }
}
