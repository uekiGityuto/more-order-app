import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/component/button/navigation_button.dart';
import 'package:more_order/ui/component/button/text_link_button.dart';
import 'package:more_order/ui/component/error_message.dart';
import 'package:more_order/ui/component/form/simple_select_form.dart';
import 'package:more_order/ui/component/loader.dart';
import 'package:more_order/ui/component/typography/section_title.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/management/payment_method/add/page.dart';
import 'package:more_order/ui/page/management/phrase/add/page.dart';
import 'package:more_order/ui/page/management/reason/add/page.dart';
import 'package:more_order/ui/page/order/display/page.dart';
import 'package:more_order/ui/page/order/select/component/no_payment_method.dart';
import 'package:more_order/ui/page/order/select/component/no_phrase.dart';
import 'package:more_order/ui/page/order/select/component/no_reason.dart';
import 'package:more_order/ui/page/order/select/component/phrase_list_tile_form.dart';
import 'package:more_order/ui/page/order/select/registered/form/registered_order_form_controller.dart';
import 'package:more_order/ui/style/extension/list_space_between.dart';

class RegisteredOrderSelectPage extends ConsumerWidget {
  final String sceneName;

  const RegisteredOrderSelectPage({Key? key, required this.sceneName})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderForm =
        ref.watch(registeredOrderFormControllerProvider(sceneName));
    final scene = orderForm.scene;
    final reasons = orderForm.reasons;
    final paymentMethods = orderForm.paymentMethods;
    return orderForm.creationStatus == FormCreationStatus.failed
        ? const ErrorMessage()
        : scene == null || reasons == null || paymentMethods == null
            ? const Loader()
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(
                              text: "フレーズ",
                              rightContent: TextLinkButton(
                                nextPage: const PhraseAddPage(),
                                text: reasons.isEmpty ? 'フレーズの登録' : 'フレーズの追加',
                              ),
                            ),
                            scene.phrases.isEmpty
                                ? const NoPhrase()
                                : Container(
                                    margin: const EdgeInsets.only(bottom: 12.0),
                                    child: const Text(
                                        "各フレーズの右側にある「+」ボタンをタップして注文したい個数を指定してください。"),
                                  ),
                            ...scene.phrases.map(
                              (phrase) {
                                return PhraseListTileForm(
                                  title: phrase.phrase,
                                  quantity: orderForm.phrasesInput[phrase.id]
                                      .toString(),
                                  countUp: () {
                                    ref
                                        .read(
                                            registeredOrderFormControllerProvider(
                                                    sceneName)
                                                .notifier)
                                        .onChangePhrasesByCountUp(phrase.id);
                                  },
                                  countDown: () {
                                    ref
                                        .read(
                                            registeredOrderFormControllerProvider(
                                                    sceneName)
                                                .notifier)
                                        .onChangePhrasesByCountDown(phrase.id);
                                  },
                                );
                              },
                            ).toList(),
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
                                              registeredOrderFormControllerProvider(
                                                      sceneName)
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
                                              registeredOrderFormControllerProvider(
                                                      sceneName)
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
                                .read(registeredOrderFormControllerProvider(
                                        sceneName)
                                    .notifier)
                                .toOrders(),
                            paymentMethod: orderForm.paymentMethods
                                ?.firstWhereOrNull((p) =>
                                    p.id == orderForm.paymentMethodInput),
                          ),
                          text: '注文内容を表示する',
                          disabled: scene.phrases.isEmpty &&
                              reasons.isEmpty &&
                              paymentMethods.isEmpty,
                        ),
                      ].withSpaceBetween(height: 24.0),
                    ),
                  ),
                ],
              );
  }
}
