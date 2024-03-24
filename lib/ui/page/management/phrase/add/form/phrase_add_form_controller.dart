import 'package:formz/formz.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/management/phrase/add/form/phrase_add_form.dart';
import 'package:more_order/ui/page/management/phrase/form/phrase_validation.dart';
import 'package:more_order/usecase/state/scenes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phrase_add_form_controller.g.dart';

@riverpod
class PhraseAddFormController extends _$PhraseAddFormController {
  @override
  PhraseAddForm build() {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return scenesFuture.when(
        error: (e, s) => PhraseAddForm(
              creationStatus: FormCreationStatus.failed,
              phraseInput: const PhraseInput.pure(),
              scenes: null,
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        loading: () => PhraseAddForm(
              creationStatus: FormCreationStatus.creating,
              phraseInput: const PhraseInput.pure(),
              scenes: null,
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        data: (scenes) {
          final initialScenesMap = {for (var scene in scenes) scene.id: false};
          return PhraseAddForm(
            creationStatus: FormCreationStatus.created,
            phraseInput: const PhraseInput.pure(),
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
