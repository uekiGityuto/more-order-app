import 'package:formz/formz.dart';

const sceneLengthLimit = 30;

enum SceneInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$sceneLengthLimit文字以下で入力してください'),
  ;

  const SceneInputError({required this.errorMessage});

  final String errorMessage;
}

class SceneInput extends FormzInput<String, SceneInputError> {
  const SceneInput.pure() : super.pure('');
  const SceneInput.dirty({String value = ''}) : super.dirty(value);

  @override
  SceneInputError? validator(String value) {
    if (value.isEmpty) return SceneInputError.empty;
    if (value.length >= 30) return SceneInputError.tooLonger;
    return null;
  }
}
