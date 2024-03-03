import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/ui/page/management/reason/add/form/add_reason_form.dart';
import 'package:smart_order_app/ui/page/management/reason/form/reason_validation.dart';

part 'add_reason_form_controller.g.dart';

@riverpod
class AddReasonFormController extends _$AddReasonFormController {
  @override
  AddReasonForm build() {
    return AddReasonForm(
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
}
