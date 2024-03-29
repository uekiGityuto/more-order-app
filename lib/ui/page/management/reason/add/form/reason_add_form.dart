import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/ui/page/management/reason/form/reason_validation.dart';

part 'reason_add_form.freezed.dart';

@freezed
class ReasonAddForm with _$ReasonAddForm {
  factory ReasonAddForm({
    required ReasonInput reasonInput,
    required bool isDefault,
    required bool isValid,
  }) = _ReasonAddForm;
}
