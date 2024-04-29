import 'dart:math';

import 'package:collection/collection.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/order/form/order.dart';
import 'package:more_order/ui/page/order/select/custom/form/custom_order_form.dart';
import 'package:more_order/usecase/state/custom_order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_order_form_controller.g.dart';

@riverpod
class CustomOrderFormController extends _$CustomOrderFormController {
  @override
  CustomOrderForm build() {
    final orderFuture = ref.watch(customOrderProvider);
    return orderFuture.when(
      error: (e, s) => CustomOrderForm(
        creationStatus: FormCreationStatus.failed,
        reasons: null,
        reasonInput: null,
        ordersInput: const {},
        paymentMethods: null,
        paymentMethodInput: null,
      ),
      loading: () => CustomOrderForm(
        creationStatus: FormCreationStatus.creating,
        reasons: null,
        reasonInput: null,
        ordersInput: const {},
        paymentMethods: null,
        paymentMethodInput: null,
      ),
      data: (order) {
        return CustomOrderForm(
          creationStatus: FormCreationStatus.created,
          reasons: order.reasons,
          reasonInput: order.reasons.firstWhereOrNull((r) => r.isDefault)?.id,
          ordersInput: {
            for (int i = 0; i <= 4; i++) i: const Order(phrase: "", quantity: 0)
          },
          paymentMethods: order.paymentMethods,
          paymentMethodInput:
              order.paymentMethods.firstWhereOrNull((p) => p.isDefault)?.id,
        );
      },
    );
  }

  void onChangeReason(Id? id) {
    state = state.copyWith(
      reasonInput: id,
    );
  }

  void onChangePhrase(int key, String phrase) {
    final ordersInput = Map<int, Order>.from(state.ordersInput);
    if (ordersInput[key] == null) {
      return;
    }
    ordersInput[key] = ordersInput[key]!.copyWith(phrase: phrase);
    state = state.copyWith(
      ordersInput: ordersInput,
    );
  }

  void onChangeQuantityByCountUp(int key) {
    final ordersInput = Map<int, Order>.from(state.ordersInput);
    if (ordersInput[key] == null) {
      return;
    }
    ordersInput[key] =
        ordersInput[key]!.copyWith(quantity: ordersInput[key]!.quantity + 1);
    state = state.copyWith(
      ordersInput: ordersInput,
    );
  }

  void onChangeQuantityByCountDown(int key) {
    final ordersInput = Map<int, Order>.from(state.ordersInput);
    if (ordersInput[key] == null) {
      return;
    }
    if (ordersInput[key]!.quantity <= 0) {
      ordersInput[key] = ordersInput[key]!.copyWith(quantity: 0);
    } else {
      ordersInput[key] =
          ordersInput[key]!.copyWith(quantity: ordersInput[key]!.quantity - 1);
    }
    state = state.copyWith(
      ordersInput: ordersInput,
    );
  }

  void addEmptyOrder() {
    final ordersInput = Map<int, Order>.from(state.ordersInput);
    int nextKey = ordersInput.keys
            .fold(0, (previousValue, element) => max(previousValue, element)) +
        1;
    ordersInput[nextKey] = const Order(phrase: "", quantity: 0);
    state = state.copyWith(
      ordersInput: ordersInput,
    );
  }

  List<Order> toOrders() {
    return state.ordersInput.entries
        .map((entry) => entry.value)
        .where((order) => !order.isEmpty())
        .toList();
  }

  void onChangePaymentMethod(Id? id) {
    state = state.copyWith(
      paymentMethodInput: id,
    );
  }
}
