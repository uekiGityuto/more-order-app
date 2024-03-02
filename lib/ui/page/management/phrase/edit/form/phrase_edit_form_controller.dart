import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';
import 'package:smart_order_app/ui/page/management/phrase/edit/form/phrase_form.dart';
import 'package:smart_order_app/ui/page/management/phrase/edit/form/phrase_validation.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

part 'phrase_edit_form_controller.g.dart';

@riverpod
class PhraseEditFormController extends _$PhraseEditFormController {
  @override
  PhraseForm build(Phrase phrase) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return scenesFuture.when(
        error: (e, s) => PhraseForm(
              creationStatus: FormCreationStatus.failed,
              phraseInput: const PhraseInput.pure(),
              scenes: null,
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        loading: () => PhraseForm(
              creationStatus: FormCreationStatus.creating,
              phraseInput: const PhraseInput.pure(),
              scenes: null,
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        data: (scenes) {
          final scenesOfBelonging = phrase.getScenesOfBelonging(scenes);
          final initialScenesMap = {
            for (final scene in scenes)
              scene.id: scenesOfBelonging.any(
                  (final sceneOfBelonging) => sceneOfBelonging.id == scene.id),
          };
          return PhraseForm(
            creationStatus: FormCreationStatus.created,
            phraseInput: PhraseInput.pure(value: phrase.phrase),
            scenes: scenes,
            scenesInput: ScenesInput.pure(value: initialScenesMap),
            isValid: false,
          );
        });
  }

  void onChangePhrase(String value) {
    final phraseInput = PhraseInput.dirty(value: value);
    state = state.copyWith(
        phraseInput: phraseInput,
        isValid: Formz.validate([
          phraseInput,
          state.scenesInput,
        ]));
  }

  void onChangeScenes(Id id, bool? isChecked) {
    final value = Map<Id, bool>.from(state.scenesInput.value)
      ..[id] = isChecked ?? false;
    final scenesInput = ScenesInput.dirty(value: value);
    state = state.copyWith(
        scenesInput: scenesInput,
        isValid: Formz.validate([
          scenesInput,
          state.phraseInput,
        ]));
  }
}
