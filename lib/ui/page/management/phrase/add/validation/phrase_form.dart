import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/validation/phrase_validation.dart';

part 'phrase_form.freezed.dart';

@freezed
class PhraseForm with _$PhraseForm {
  factory PhraseForm({
    required PhraseInput phraseInput,
    required ScenesInput scenesInput,
    required bool isValid,
  }) = _PhraseForm;
}
