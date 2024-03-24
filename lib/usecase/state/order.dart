import 'package:more_order/domain/entity/payment_method.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/domain/entity/scene.dart';
import 'package:more_order/usecase/state/payment_methods.dart';
import 'package:more_order/usecase/state/reasons.dart';
import 'package:more_order/usecase/state/scenes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order.g.dart';

typedef Order = ({
  List<Scene> scenes,
  List<Reason> reasons,
  List<PaymentMethod> paymentMethods,
});

@riverpod
Future<Order> order(OrderRef ref) async {
  late List<Scene> scenes;
  late List<Reason> reasons;
  late List<PaymentMethod> paymentMethods;

  await Future.wait([
    ref.watch(scenesNotifierProvider.future).then(
          (value) => scenes = value,
        ),
    ref.watch(reasonsNotifierProvider.future).then(
          (value) => reasons = value,
        ),
    ref.watch(paymentMethodsNotifierProvider.future).then(
          (value) => paymentMethods = value,
        ),
  ]);
  return (
    scenes: scenes,
    reasons: reasons,
    paymentMethods: paymentMethods,
  );
}
