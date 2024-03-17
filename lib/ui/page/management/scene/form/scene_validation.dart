import 'package:formz/formz.dart';

const maxSceneLength = 30;

enum SceneInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$maxSceneLength文字以下で入力して下さい'),
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
    if (value.length >= maxSceneLength) return SceneInputError.tooLonger;
    return null;
  }
}
