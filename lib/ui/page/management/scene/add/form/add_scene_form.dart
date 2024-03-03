import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/scene/form/scene_validation.dart';

part 'add_scene_form.freezed.dart';

@freezed
class AddSceneForm with _$AddSceneForm {
  factory AddSceneForm({
    required SceneInput sceneInput,
    required bool isValid,
  }) = _AddSceneForm;
}
