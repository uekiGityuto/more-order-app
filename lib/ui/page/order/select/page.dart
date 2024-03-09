import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/component/button/navigation_button.dart';
import 'package:smart_order_app/ui/component/error_message.dart';
import 'package:smart_order_app/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/typography/section_title.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/order/display/page.dart';
import 'package:smart_order_app/ui/page/order/select/component/no_payment_method.dart';
import 'package:smart_order_app/ui/page/order/select/component/no_phrase.dart';
import 'package:smart_order_app/ui/page/order/select/component/no_reason.dart';
import 'package:smart_order_app/ui/page/order/select/component/payment_method_select_form.dart';
import 'package:smart_order_app/ui/page/order/select/component/reason_select_form.dart';
import 'package:smart_order_app/ui/page/order/select/form/order_form_controller.dart';
import 'package:smart_order_app/ui/style/extension/list_space_between.dart';

class OrderSelectPage extends ConsumerWidget {
  final String sceneName;

  const OrderSelectPage({Key? key, required this.sceneName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderForm = ref.watch(orderFormControllerProvider(sceneName));
    final scene = orderForm.scene;
    final reasons = orderForm.reasons;
    final paymentMethods = orderForm.paymentMethods;
    return DefaultLayout(
      title: sceneName,
      body: orderForm.creationStatus == FormCreationStatus.failed
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
                              const SectionTitle(text: "理由"),
                              reasons.isEmpty
                                  ? const NoReason()
                                  : ReasonSelectForm(
                                      value: orderForm.reasonInput,
                                      reasons: reasons,
                                      onChanged: (Id? newValue) {
                                        ref
                                            .read(orderFormControllerProvider(
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
                              const SectionTitle(text: "フレーズ"),
                              if (scene.phrases.isEmpty) const NoPhrase(),
                              ...scene.phrases.map(
                                (phrase) {
                                  return SimpleCheckboxListTile(
                                    value: orderForm.phrasesInput[phrase.id],
                                    onChanged: (bool? newValue) {
                                      ref
                                          .read(orderFormControllerProvider(
                                                  sceneName)
                                              .notifier)
                                          .onChangePhrases(phrase.id, newValue);
                                    },
                                    title: phrase.phrase,
                                  );
                                },
                              ).toList(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionTitle(text: "支払方法"),
                              paymentMethods.isEmpty
                                  ? const NoPaymentMethod()
                                  : PaymentMethodSelectForm(
                                      value: orderForm.paymentMethodInput,
                                      paymentMethods: paymentMethods,
                                      onChanged: (Id? newValue) {
                                        ref
                                            .read(orderFormControllerProvider(
                                                    sceneName)
                                                .notifier)
                                            .onChangePaymentMethod(newValue);
                                      },
                                    ),
                            ],
                          ),
                        ].withSpaceBetween(height: 24.0),
                      ),
                    ),
                    NavigationButton(
                      nextPage: OrderDisplayPage(
                        reason: orderForm.reasons?.firstWhereOrNull(
                            (r) => r.id == orderForm.reasonInput),
                        phrases: scene.phrases
                            .where((p) => orderForm.phrasesInput[p.id] == true)
                            .toList(),
                        paymentMethod: orderForm.paymentMethods
                            ?.firstWhereOrNull(
                                (p) => p.id == orderForm.paymentMethodInput),
                      ),
                      text: '表示する',
                    ),
                  ],
                ),
    );
  }
}
