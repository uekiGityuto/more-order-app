import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/ui/page/management/scene/edit/form/edit_scene_form.dart';
import 'package:smart_order_app/ui/page/management/scene/form/scene_validation.dart';

part 'edit_scene_form_controller.g.dart';

@riverpod
class EditSceneFormController extends _$EditSceneFormController {
  @override
  EditSceneForm build(Scene scene) {
    // 何か入力されるまでisValidはfalseにしておく。
    // 何か入力されて、入力値が妥当であればisValidはtrueになる。
    // その後に初期状態に戻してもisValidはtrueのまま。
    // ここは初期状態と同じであればisValidがfalseになるように修正するかもしれない。
    return EditSceneForm(
      sceneInput: SceneInput.dirty(value: scene.scene),
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
