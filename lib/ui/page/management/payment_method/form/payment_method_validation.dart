import 'package:formz/formz.dart';

const methodLengthLimit = 30;

enum MethodInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$methodLengthLimit文字以下で入力してください'),
  ;

  const MethodInputError({required this.errorMessage});

  final String errorMessage;
}

class MethodInput extends FormzInput<String, MethodInputError> {
  const MethodInput.pure() : super.pure('');
  const MethodInput.dirty({String value = ''}) : super.dirty(value);

  @override
  MethodInputError? validator(String value) {
    if (value.isEmpty) return MethodInputError.empty;
    if (value.length >= methodLengthLimit) {
      return MethodInputError.tooLonger;
    }
    return null;
  }
}
