import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/reason/form/reason_validation.dart';

part 'reason_add_form.freezed.dart';

@freezed
class ReasonAddForm with _$ReasonAddForm {
  factory ReasonAddForm({
    required ReasonInput reasonInput,
    required bool isDefault,
    required bool isValid,
  }) = _ReasonAddForm;
}
