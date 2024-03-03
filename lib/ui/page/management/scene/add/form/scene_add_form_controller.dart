import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/ui/page/management/scene/add/form/scene_add_form.dart';
import 'package:smart_order_app/ui/page/management/scene/form/scene_validation.dart';

part 'scene_add_form_controller.g.dart';

@riverpod
class SceneAddFormController extends _$SceneAddFormController {
  @override
  SceneAddForm build() {
    return SceneAddForm(
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
