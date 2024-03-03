import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/page/order/select/form/order_form.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

part 'order_form_controller.g.dart';

@riverpod
class OrderFormController extends _$OrderFormController {
  @override
  OrderForm build(String sceneName) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return scenesFuture.when(
      error: (e, s) => OrderForm(
        creationStatus: FormCreationStatus.failed,
        scene: null,
        phrasesInput: const {},
      ),
      loading: () => OrderForm(
        creationStatus: FormCreationStatus.creating,
        scene: null,
        phrasesInput: const {},
      ),
      data: (scenes) {
        final scene =
            scenes.firstWhereOrNull((scene) => scene.scene == sceneName);
        if (scene == null) {
          return OrderForm(
            creationStatus: FormCreationStatus.failed,
            scene: null,
            phrasesInput: const {},
          );
        } else {
          return OrderForm(
            creationStatus: FormCreationStatus.created,
            scene: scene,
            phrasesInput: {for (var phrase in scene.phrases) phrase.id: false},
          );
        }
      },
    );
  }

  void onChangePhrases(Id id, bool? isChecked) {
    final phrasesInput = Map<Id, bool>.from(state.phrasesInput)
      ..[id] = isChecked ?? false;
    state = state.copyWith(
      phrasesInput: phrasesInput,
    );
  }
}
