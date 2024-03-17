import 'package:formz/formz.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';

const maxPhraseLength = 30;

enum PhraseInputError {
  empty(errorMessage: '未入力です'),
  tooLonger(errorMessage: '$maxPhraseLength文字以下で入力して下さい'),
  ;

  const PhraseInputError({required this.errorMessage});

  final String errorMessage;
}

class PhraseInput extends FormzInput<String, PhraseInputError> {
  const PhraseInput.pure() : super.pure('');
  const PhraseInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PhraseInputError? validator(String value) {
    if (value.isEmpty) return PhraseInputError.empty;
    if (value.length >= maxPhraseLength) return PhraseInputError.tooLonger;
    return null;
  }
}

enum ScenesInputError {
  unselected(errorMessage: '少なくとも1つのシーンを選択して下さい'),
  ;

  const ScenesInputError({required this.errorMessage});

  final String errorMessage;
}

class ScenesInput extends FormzInput<Map<Id, bool>, ScenesInputError> {
  const ScenesInput.pure({Map<Id, bool> value = const {}}) : super.pure(value);
  const ScenesInput.dirty({Map<Id, bool> value = const {}})
      : super.dirty(value);

  @override
  ScenesInputError? validator(Map<Id, bool> value) {
    final isSelected = value.values.any((selected) => selected);
    return isSelected ? null : ScenesInputError.unselected;
  }
}
