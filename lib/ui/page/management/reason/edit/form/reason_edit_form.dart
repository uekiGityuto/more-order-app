import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/reason/form/reason_validation.dart';

part 'reason_edit_form.freezed.dart';

@freezed
class ReasonEditForm with _$ReasonEditForm {
  factory ReasonEditForm({
    required ReasonInput reasonInput,
    required bool isDefault,
    required bool isValid,
  }) = _ReasonEditForm;
}
