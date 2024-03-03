import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/scene/form/scene_validation.dart';

part 'edit_scene_form.freezed.dart';

@freezed
class EditSceneForm with _$EditSceneForm {
  factory EditSceneForm({
    required SceneInput sceneInput,
    required bool isValid,
  }) = _EditSceneForm;
}
