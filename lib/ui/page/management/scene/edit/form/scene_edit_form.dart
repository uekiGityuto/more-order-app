import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/scene/form/scene_validation.dart';

part 'scene_edit_form.freezed.dart';

@freezed
class SceneEditForm with _$SceneEditForm {
  factory SceneEditForm({
    required SceneInput sceneInput,
    required bool isValid,
  }) = _SceneEditForm;
}
