import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/page/management/phrase/form/phrase_validation.dart';

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
