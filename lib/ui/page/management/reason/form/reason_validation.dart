import 'package:formz/formz.dart';

const maxReasonLength = 30;

enum ReasonInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$maxReasonLength文字以下で入力して下さい'),
  ;

  const ReasonInputError({required this.errorMessage});

  final String errorMessage;
}

class ReasonInput extends FormzInput<String, ReasonInputError> {
  const ReasonInput.pure() : super.pure('');
  const ReasonInput.dirty({String value = ''}) : super.dirty(value);

  @override
  ReasonInputError? validator(String value) {
    if (value.isEmpty) return ReasonInputError.empty;
    if (value.length >= maxReasonLength) return ReasonInputError.tooLonger;
    return null;
  }
}
