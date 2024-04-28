import 'package:collection/collection.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/order/form/order.dart';
import 'package:more_order/ui/page/order/select/registered/form/registered_order_form.dart';
import 'package:more_order/usecase/state/registered_order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registered_order_form_controller.g.dart';

@riverpod
class RegisteredOrderFormController extends _$RegisteredOrderFormController {
  @override
  RegisteredOrderForm build(String sceneName) {
    final orderFuture = ref.watch(registeredOrderProvider);
    return orderFuture.when(
      error: (e, s) => RegisteredOrderForm(
        creationStatus: FormCreationStatus.failed,
        reasons: null,
        reasonInput: null,
        scene: null,
        phrasesInput: const {},
        paymentMethods: null,
        paymentMethodInput: null,
      ),
      loading: () => RegisteredOrderForm(
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
          return RegisteredOrderForm(
            creationStatus: FormCreationStatus.failed,
            reasons: null,
            reasonInput: null,
            scene: null,
            phrasesInput: const {},
            paymentMethods: null,
            paymentMethodInput: null,
          );
        } else {
          return RegisteredOrderForm(
            creationStatus: FormCreationStatus.created,
            reasons: order.reasons,
            reasonInput: order.reasons.firstWhereOrNull((r) => r.isDefault)?.id,
            scene: scene,
            phrasesInput: {for (var phrase in scene.phrases) phrase.id: 0},
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

  void onChangePhrases(Id id, int count) {
    final phrasesInput = Map<Id, int>.from(state.phrasesInput)..[id] = count;
    state = state.copyWith(
      phrasesInput: phrasesInput,
    );
  }

  void onChangePhrasesByCountUp(Id id) {
    final phrasesInput = Map<Id, int>.from(state.phrasesInput);
    phrasesInput[id] = (phrasesInput[id] ?? 0) + 1;
    state = state.copyWith(
      phrasesInput: phrasesInput,
    );
  }

  void onChangePhrasesByCountDown(Id id) {
    final phrasesInput = Map<Id, int>.from(state.phrasesInput);
    if (phrasesInput[id] == null || phrasesInput[id]! <= 0) {
      phrasesInput[id] = 0;
    } else {
      phrasesInput[id] = phrasesInput[id]! - 1;
    }
    state = state.copyWith(
      phrasesInput: phrasesInput,
    );
  }

  List<Order> toOrders() {
    return state.scene?.phrases
            .where((p) => (state.phrasesInput[p.id] ?? 0) > 0)
            .map((p) =>
                Order(phrase: p.phrase, quantity: state.phrasesInput[p.id]!))
            .toList() ??
        [];
  }

  void onChangePaymentMethod(Id? id) {
    state = state.copyWith(
      paymentMethodInput: id,
    );
  }
}
