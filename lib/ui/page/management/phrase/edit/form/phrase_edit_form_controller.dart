import 'package:formz/formz.dart';
import 'package:more_order/domain/entity/phrase.dart';
import 'package:more_order/domain/valueObject/id.dart';
import 'package:more_order/ui/form/form_creation_status.dart';
import 'package:more_order/ui/page/management/phrase/edit/form/phrase_edit_form.dart';
import 'package:more_order/ui/page/management/phrase/form/phrase_validation.dart';
import 'package:more_order/usecase/state/scenes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phrase_edit_form_controller.g.dart';

@riverpod
class PhraseEditFormController extends _$PhraseEditFormController {
  @override
  PhraseEditForm build(Phrase phrase) {
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return scenesFuture.when(
        error: (e, s) => PhraseEditForm(
              creationStatus: FormCreationStatus.failed,
              phraseInput: const PhraseInput.pure(),
              scenes: null,
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        loading: () => PhraseEditForm(
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
          // 何か入力されるまでisValidはfalseにしておく。
          // 何か入力されて、入力値が妥当であればisValidはtrueになる。
          // その後に初期状態に戻してもisValidはtrueのまま。
          // ここは初期状態と同じであればisValidがfalseになるように修正するかもしれない。
          return PhraseEditForm(
            creationStatus: FormCreationStatus.created,
            phraseInput: PhraseInput.dirty(value: phrase.phrase),
            scenes: scenes,
            scenesInput: ScenesInput.dirty(value: initialScenesMap),
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
