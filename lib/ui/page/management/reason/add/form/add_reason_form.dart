import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/reason/form/reason_validation.dart';

part 'add_reason_form.freezed.dart';

@freezed
class AddReasonForm with _$AddReasonForm {
  factory AddReasonForm({
    required ReasonInput reasonInput,
    required bool isDefault,
    required bool isValid,
  }) = _AddReasonForm;
}
