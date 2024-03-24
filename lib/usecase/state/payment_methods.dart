import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/errors/error.dart';
import 'package:more_order/domain/errors/max_add_count.dart';
import 'package:more_order/domain/repository/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_methods.g.dart';

@Riverpod(keepAlive: true)
class PaymentMethodsNotifier extends _$PaymentMethodsNotifier {
  @override
  Future<List<PaymentMethod>> build() async {
    state = const AsyncValue.loading();
    final repository = ref.read(repositoryProvider);
    return await repository.fetchPaymentMethods();
  }

  Future<void> updateState() async {
    state = AsyncValue.data(await build());
  }

  Future<void> addPaymentMethod(String method, bool isDefault) async {
    final repository = ref.read(repositoryProvider);
    final count = await repository.countPaymentMethods();
    if (MaxAddCount.paymentMethod.isOver(count)) {
      throw const DomainException(ErrorType.paymentMethodCountOver);
    }
    await repository.addPaymentMethod(method, isDefault);
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
