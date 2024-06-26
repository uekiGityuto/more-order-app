import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:more_order/constants.dart';
import 'package:more_order/ui/component/error_message.dart';
import 'package:more_order/ui/component/list_tile_navigation.dart';
import 'package:more_order/ui/component/loader.dart';
import 'package:more_order/ui/component/typography/section_title.dart';
import 'package:more_order/ui/page/order/select/page.dart';
import 'package:more_order/usecase/state/scenes.dart';

class SimpleDrawer extends ConsumerWidget {
  const SimpleDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 12.0),
          child: ListView(
            children: [
              const SectionTitle(text: "場面選択"),
              scenesFuture.when(
                error: (e, s) => const ErrorMessage(),
                loading: () => const Loader(),
                data: (scenes) {
                  return Column(
                    children: [
                      ...scenes.map((scene) {
                        return ListTileNavigation(
                          option: ListTileOption(
                            title: scene.scene,
                            nextPage: OrderSelectPage(sceneName: scene.scene),
                            navigationType: NavigationType.pushAndRemoveUntil,
                          ),
                        );
                      }).toList(),
                      ListTileNavigation(
                        option: ListTileOption(
                          title: customScene,
                          nextPage:
                              const OrderSelectPage(sceneName: customScene),
                          navigationType: NavigationType.pushAndRemoveUntil,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
