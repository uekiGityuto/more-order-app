import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/ui/page/management/reason/edit/form/reason_edit_form.dart';
import 'package:smart_order_app/ui/page/management/reason/form/reason_validation.dart';

part 'reason_edit_form_controller.g.dart';

@riverpod
class ReasonEditFormController extends _$ReasonEditFormController {
  @override
  ReasonEditForm build(Reason reason) {
    return ReasonEditForm(
      reasonInput: ReasonInput.dirty(value: reason.reason),
      isDefault: reason.isDefault,
      isValid: false,
    );
  }

  void onChangeReason(String value) {
    final reasonInput = ReasonInput.dirty(value: value);
    state = state.copyWith(
        reasonInput: reasonInput,
        isValid: Formz.validate([
          reasonInput,
        ]));
  }

  void onChangeIsDefault(bool? value) {
    state = state.copyWith(
        isDefault: value ?? false,
        isValid: Formz.validate([
          state.reasonInput,
        ]));
  }
}
