import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/entity/scene.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/management/phrase/form/phrase_validation.dart';

part 'phrase_edit_form.freezed.dart';

@freezed
class PhraseEditForm with _$PhraseEditForm {
  factory PhraseEditForm({
    required FormCreationStatus creationStatus,
    required PhraseInput phraseInput,
    required List<Scene>? scenes,
    required ScenesInput scenesInput,
    required bool isValid,
  }) = _PhraseEditForm;
}
