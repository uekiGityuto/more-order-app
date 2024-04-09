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

  Map<String, int> toPhrasesWithQuantity() {
    return state.scene?.phrases
            .where((p) => (state.phrasesInput[p.id] ?? 0) > 0)
            .fold<Map<String, int>>({}, (map, p) {
          map[p.phrase] = state.phrasesInput[p.id]!;
          return map;
        }) ??
        {};
  }

  void onChangePaymentMethod(Id? id) {
    state = state.copyWith(
      paymentMethodInput: id,
    );
  }
}
