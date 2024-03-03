import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_order_app/ui/component/error_message.dart';
import 'package:smart_order_app/ui/component/loader.dart';
import 'package:smart_order_app/ui/component/simple_checkbox_list_tile.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/layout/default_layout.dart';
import 'package:smart_order_app/ui/page/order/display/page.dart';
import 'package:smart_order_app/ui/page/order/select/form/order_form_controller.dart';

class OrderSelectPage extends ConsumerWidget {
  final String sceneName;

  const OrderSelectPage({Key? key, required this.sceneName}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderForm = ref.watch(orderFormControllerProvider(sceneName));
    final scene = orderForm.scene;
    final reasons = orderForm.reasons;
    return DefaultLayout(
      title: sceneName,
      body: orderForm.creationStatus == FormCreationStatus.failed
          ? const ErrorMessage()
          : scene == null || reasons == null
              ? const Loader()
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: scene.phrases.map(
                          (phrase) {
                            return SimpleCheckboxListTile(
                              value: orderForm.phrasesInput[phrase.id],
                              onChanged: (bool? newValue) {
                                ref
                                    .read(orderFormControllerProvider(sceneName)
                                        .notifier)
                                    .onChangePhrases(phrase.id, newValue);
                              },
                              title: phrase.phrase,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDisplayPage(
                              sceneName: sceneName,
                              phrases: scene.phrases
                                  .where((p) =>
                                      orderForm.phrasesInput[p.id] == true)
                                  .toList(),
                            ),
                          ),
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
    );
  }
}
