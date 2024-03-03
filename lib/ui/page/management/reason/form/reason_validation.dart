import 'package:formz/formz.dart';

const reasonLengthLimit = 30;

enum ReasonInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$reasonLengthLimit文字以下で入力してください'),
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
    if (value.length >= reasonLengthLimit) return ReasonInputError.tooLonger;
    return null;
  }
}
