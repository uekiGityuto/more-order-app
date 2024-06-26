import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/component/button/navigation_button.dart';
import 'package:more_order/ui/component/button/text_link_button.dart';
import 'package:more_order/ui/component/error_message.dart';
import 'package:more_order/ui/component/form/form_error_message.dart';
import 'package:more_order/ui/component/form/simple_select_form.dart';
import 'package:more_order/ui/component/inline_text_link.dart';
import 'package:more_order/ui/component/loader.dart';
import 'package:more_order/ui/component/typography/section_title.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/management/payment_method/add/page.dart';
import 'package:more_order/ui/page/management/phrase/add/page.dart';
import 'package:more_order/ui/page/management/reason/add/page.dart';
import 'package:more_order/ui/page/order/display/page.dart';
import 'package:more_order/ui/page/order/select/component/no_payment_method.dart';
import 'package:more_order/ui/page/order/select/component/no_reason.dart';
import 'package:more_order/ui/page/order/select/custom/component/add_empty_order.dart';
import 'package:more_order/ui/page/order/select/custom/component/phrase_list_tile_form.dart';
import 'package:more_order/ui/page/order/select/custom/form/custom_order_form_controller.dart';
import 'package:more_order/ui/style/extension/list_space_between.dart';

class CustomOrderSelectPage extends ConsumerWidget {
  const CustomOrderSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderForm = ref.watch(customOrderFormControllerProvider);
    final reasons = orderForm.reasons;
    final paymentMethods = orderForm.paymentMethods;
    return orderForm.creationStatus == FormCreationStatus.failed
        ? const ErrorMessage()
        : reasons == null || paymentMethods == null
            ? const Loader()
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const Text("この画面では登録していないフレーズを使って注文できます。"),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SectionTitle(
                              text: "フレーズ",
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 12.0),
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      "注文したいフレーズとその個数を入力して下さい。\nここに入力したフレーズは保存されないため、繰り返し使いたい場合は",
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    buildInlineTextLink(
                                      context: context,
                                      text: 'フレーズの登録',
                                      nextPage: const PhraseAddPage(),
                                    ),
                                    const TextSpan(text: "をおすすめします。"),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Theme.of(context).colorScheme.surface,
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Column(
                                children: [
                                  ...List.generate(
                                    orderForm.ordersInput.entries
                                        .toList()
                                        .length,
                                    (index) {
                                      final entry = orderForm
                                          .ordersInput.entries
                                          .toList()[index];

                                      return PhraseListTileForm(
                                        quantity:
                                            entry.value.quantity.toString(),
                                        onChangedPhrase: (phrase) {
                                          ref
                                              .read(
                                                  customOrderFormControllerProvider
                                                      .notifier)
                                              .onChangePhrase(
                                                  entry.key, phrase);
                                        },
                                        countUp: () {
                                          ref
                                              .read(
                                                  customOrderFormControllerProvider
                                                      .notifier)
                                              .onChangeQuantityByCountUp(
                                                  entry.key);
                                        },
                                        countDown: () {
                                          ref
                                              .read(
                                                  customOrderFormControllerProvider
                                                      .notifier)
                                              .onChangeQuantityByCountDown(
                                                  entry.key);
                                        },
                                      );
                                    },
                                  ),
                                  AddEmptyOrder(
                                    onTapAdd: ref
                                        .read(customOrderFormControllerProvider
                                            .notifier)
                                        .addEmptyOrder,
                                  )
                                ],
                              ),
                            ),
                            if (ref
                                .read(
                                    customOrderFormControllerProvider.notifier)
                                .isQuantityZero())
                              const FormErrorMessage(
                                errorMessage: "個数が0のフレーズは注文内容に含まれません。",
                              ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(
                              text: "理由",
                              rightContent: TextLinkButton(
                                nextPage: const ReasonAddPage(),
                                text: reasons.isEmpty ? '理由の登録' : '理由の追加',
                              ),
                            ),
                            reasons.isEmpty
                                ? const NoReason()
                                : SimpleSelectForm(
                                    value: orderForm.reasonInput,
                                    options: reasons
                                        .map(
                                          (r) => Option(
                                              value: r.id, label: r.reason),
                                        )
                                        .toList(),
                                    onChanged: (Id? newValue) {
                                      ref
                                          .read(
                                              customOrderFormControllerProvider
                                                  .notifier)
                                          .onChangeReason(newValue);
                                    },
                                  ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(
                              text: "支払方法",
                              rightContent: TextLinkButton(
                                nextPage: const PaymentMethodAddPage(),
                                text: paymentMethods.isEmpty
                                    ? '支払方法の登録'
                                    : '支払方法の追加',
                              ),
                            ),
                            paymentMethods.isEmpty
                                ? const NoPaymentMethod()
                                : SimpleSelectForm(
                                    value: orderForm.paymentMethodInput,
                                    options: paymentMethods
                                        .map(
                                          (p) => Option(
                                              value: p.id, label: p.method),
                                        )
                                        .toList(),
                                    onChanged: (Id? newValue) {
                                      ref
                                          .read(
                                              customOrderFormControllerProvider
                                                  .notifier)
                                          .onChangePaymentMethod(newValue);
                                    },
                                  ),
                          ],
                        ),
                        NavigationButton(
                          nextPage: OrderDisplayPage(
                            reason: orderForm.reasons?.firstWhereOrNull(
                                (r) => r.id == orderForm.reasonInput),
                            orders: ref
                                .read(
                                    customOrderFormControllerProvider.notifier)
                                .toOrders(),
                            paymentMethod: orderForm.paymentMethods
                                ?.firstWhereOrNull((p) =>
                                    p.id == orderForm.paymentMethodInput),
                          ),
                          text: '注文内容を表示する',
                          disabled: reasons.isEmpty && paymentMethods.isEmpty,
                        ),
                      ].withSpaceBetween(height: 24.0),
                    ),
                  ),
                ],
              );
  }
}
