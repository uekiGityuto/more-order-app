import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/usecase/state/payment_methods.dart';
import 'package:more_order/usecase/state/reasons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_order.g.dart';

typedef CustomOrder = ({
  List<Reason> reasons,
  List<PaymentMethod> paymentMethods,
});

@riverpod
Future<CustomOrder> customOrder(CustomOrderRef ref) async {
  late List<Reason> reasons;
  late List<PaymentMethod> paymentMethods;

  await Future.wait([
    ref.watch(reasonsNotifierProvider.future).then(
          (value) => reasons = value,
        ),
    ref.watch(paymentMethodsNotifierProvider.future).then(
          (value) => paymentMethods = value,
        ),
  ]);
  return (
    reasons: reasons,
    paymentMethods: paymentMethods,
  );
}
