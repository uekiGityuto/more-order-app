import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order_app/ui/page/management/scene/form/scene_validation.dart';

part 'scene_add_form.freezed.dart';

@freezed
class SceneAddForm with _$SceneAddForm {
  factory SceneAddForm({
    required SceneInput sceneInput,
    required bool isValid,
  }) = _SceneAddForm;
}
