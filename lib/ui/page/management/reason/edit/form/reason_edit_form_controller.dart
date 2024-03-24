import 'package:formz/formz.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/ui/page/management/reason/edit/form/reason_edit_form.dart';
import 'package:more_order/ui/page/management/reason/form/reason_validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
