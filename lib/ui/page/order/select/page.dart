import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/constants.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/component/app_bar/simple_bottom_app_bar.dart';
import 'package:more_order/ui/component/button/navigation_button.dart';
import 'package:more_order/ui/component/button/text_link_button.dart';
import 'package:more_order/ui/component/error_message.dart';
import 'package:more_order/ui/component/form/simple_checkbox_list_tile.dart';
import 'package:more_order/ui/component/form/simple_select_form.dart';
import 'package:more_order/ui/component/loader.dart';
import 'package:more_order/ui/component/typography/section_title.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/layout/default_layout.dart';
import 'package:more_order/ui/page/management/payment_method/add/page.dart';
import 'package:more_order/ui/page/management/phrase/add/page.dart';
import 'package:more_order/ui/page/management/reason/add/page.dart';
import 'package:more_order/ui/page/order/display/page.dart';
import 'package:more_order/ui/page/order/select/component/no_payment_method.dart';
import 'package:more_order/ui/page/order/select/component/no_phrase.dart';
import 'package:more_order/ui/page/order/select/component/no_reason.dart';
import 'package:more_order/ui/page/order/select/form/order_form_controller.dart';
import 'package:more_order/ui/page/tutorial/page.dart';
import 'package:more_order/ui/style/extension/list_space_between.dart';
import 'package:more_order/usecase/controller/shared_preferences.dart';

class OrderSelectPage extends ConsumerWidget {
  final String sceneName;

  const OrderSelectPage({Key? key, required this.sceneName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _showTutorial(context));

    final orderForm = ref.watch(orderFormControllerProvider(sceneName));
    final scene = orderForm.scene;
    final reasons = orderForm.reasons;
    final paymentMethods = orderForm.paymentMethods;
    return DefaultLayout(
      title: sceneName,
      suppressBack: true,
      bottomAppBarOption: sceneName == defaultScene
          ? const BottomAppBarOption(
              currentLocation: NavigationItem.defaultSceneItem)
          : null,
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
                              SectionTitle(
                                text: "フレーズ",
                                rightContent: TextLinkButton(
                                  nextPage: const PhraseAddPage(),
                                  text: reasons.isEmpty ? 'フレーズの登録' : 'フレーズの追加',
                                ),
                              ),
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
                                            .read(orderFormControllerProvider(
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
                              phrases: scene.phrases
                                  .where((p) =>
                                      orderForm.phrasesInput[p.id] == true)
                                  .toList(),
                              paymentMethod: orderForm.paymentMethods
                                  ?.firstWhereOrNull((p) =>
                                      p.id == orderForm.paymentMethodInput),
                            ),
                            text: '表示する',
                            disabled: scene.phrases.isEmpty &&
                                reasons.isEmpty &&
                                paymentMethods.isEmpty,
                          ),
                        ].withSpaceBetween(height: 24.0),
                      ),
                    ),
                  ],
                ),
    );
  }

  Future<void> _showTutorial(BuildContext context) async {
    final navigator = Navigator.of(context, rootNavigator: true);
    // 開発用。チュートリアルを表示したいときに使う。
    // await SharedPreferencesController.clear();
    final isTutorialDisplayed =
        await SharedPreferencesController.isTutorialDisplayed();
    if (!isTutorialDisplayed) {
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const TutorialPage(),
        ),
      );
    }
  }
}
