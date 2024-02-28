import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/scene/add/form/scene_validation.dart';

part 'scene_form.freezed.dart';

@freezed
class SceneForm with _$SceneForm {
  factory SceneForm({
    required SceneInput sceneInput,
    required bool isValid,
  }) = _SceneForm;
}
