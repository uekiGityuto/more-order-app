import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/ui/page/management/scene/add/form/scene_form.dart';
import 'package:smart_order_app/ui/page/management/scene/add/form/scene_validation.dart';

part 'scene_form_controller.g.dart';

@riverpod
class SceneFormController extends _$SceneFormController {
  @override
  SceneForm build() {
    return SceneForm(
      sceneInput: const SceneInput.pure(),
      isValid: false,
    );
  }

  void onChangeScene(String value) {
    final sceneInput = SceneInput.dirty(value: value);
    state = state.copyWith(
        sceneInput: sceneInput,
        isValid: Formz.validate([
          sceneInput,
        ]));
  }
}
