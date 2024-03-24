import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/ui/page/management/scene/form/scene_validation.dart';

part 'scene_edit_form.freezed.dart';

@freezed
class SceneEditForm with _$SceneEditForm {
  factory SceneEditForm({
    required SceneInput sceneInput,
    required bool isValid,
  }) = _SceneEditForm;
}
