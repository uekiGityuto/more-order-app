import 'package:collection/collection.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/order/select/form/order_form.dart';
import 'package:more_order/usecase/state/order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_form_controller.g.dart';

@riverpod
class OrderFormController extends _$OrderFormController {
  @override
  OrderForm build(String sceneName) {
    final orderFuture = ref.watch(orderProvider);
    return orderFuture.when(
      error: (e, s) => OrderForm(
        creationStatus: FormCreationStatus.failed,
        reasons: null,
        reasonInput: null,
        scene: null,
        phrasesInput: const {},
        paymentMethods: null,
        paymentMethodInput: null,
      ),
      loading: () => OrderForm(
        creationStatus: FormCreationStatus.creating,
        reasons: null,
        reasonInput: null,
        scene: null,
        phrasesInput: const {},
        paymentMethods: null,
        paymentMethodInput: null,
      ),
      data: (order) {
        final scene =
            order.scenes.firstWhereOrNull((scene) => scene.scene == sceneName);
        if (scene == null) {
          return OrderForm(
            creationStatus: FormCreationStatus.failed,
            reasons: null,
            reasonInput: null,
            scene: null,
            phrasesInput: const {},
            paymentMethods: null,
            paymentMethodInput: null,
          );
        } else {
          return OrderForm(
            creationStatus: FormCreationStatus.created,
            reasons: order.reasons,
            reasonInput: order.reasons.firstWhereOrNull((r) => r.isDefault)?.id,
            scene: scene,
            phrasesInput: {for (var phrase in scene.phrases) phrase.id: false},
            paymentMethods: order.paymentMethods,
            paymentMethodInput:
                order.paymentMethods.firstWhereOrNull((p) => p.isDefault)?.id,
          );
        }
      },
    );
  }

  void onChangeReason(Id? id) {
    state = state.copyWith(
      reasonInput: id,
    );
  }

  void onChangePhrases(Id id, bool? isChecked) {
    final phrasesInput = Map<Id, bool>.from(state.phrasesInput)
      ..[id] = isChecked ?? false;
    state = state.copyWith(
      phrasesInput: phrasesInput,
    );
  }

  void onChangePaymentMethod(Id? id) {
    state = state.copyWith(
      paymentMethodInput: id,
    );
  }
}
