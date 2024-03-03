import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/usecase/state/reasons.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

part 'order.g.dart';

typedef Order = ({
  List<Scene> scenes,
  List<Reason> reasons,
});

@riverpod
Future<Order> order(OrderRef ref) async {
  late List<Scene> scenes;
  late List<Reason> reasons;

  await Future.wait([
    ref.watch(scenesNotifierProvider.future).then(
          (value) => scenes = value,
        ),
    ref.watch(reasonsNotifierProvider.future).then(
          (value) => reasons = value,
        ),
  ]);
  return (
    scenes: scenes,
    reasons: reasons,
  );
}
