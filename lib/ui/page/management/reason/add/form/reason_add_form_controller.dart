import 'package:formz/formz.dart';
import 'package:more_order_app/ui/page/management/reason/add/form/reason_add_form.dart';
import 'package:more_order_app/ui/page/management/reason/form/reason_validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reason_add_form_controller.g.dart';

@riverpod
class ReasonAddFormController extends _$ReasonAddFormController {
  @override
  ReasonAddForm build() {
    return ReasonAddForm(
      reasonInput: const ReasonInput.pure(),
      isDefault: false,
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
