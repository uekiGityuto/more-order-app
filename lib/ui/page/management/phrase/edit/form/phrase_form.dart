import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/page/management/phrase/edit/form/phrase_validation.dart';

part 'phrase_form.freezed.dart';

@freezed
class PhraseForm with _$PhraseForm {
  factory PhraseForm({
    required FormCreationStatus creationStatus,
    required PhraseInput phraseInput,
    required List<Scene>? scenes,
    required ScenesInput scenesInput,
    required bool isValid,
  }) = _PhraseForm;
}
