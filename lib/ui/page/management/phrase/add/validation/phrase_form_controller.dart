import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/validation/phrase_form.dart';
import 'package:smart_order_app/ui/page/management/phrase/add/validation/phrase_validation.dart';
import 'package:smart_order_app/usecase/state/scenes.dart';

part 'phrase_form_controller.g.dart';

@riverpod
class PhraseFormController extends _$PhraseFormController {
  @override
  PhraseForm build() {
    // TODO: ここの書き方はかなり微妙。修正する。
    final scenesFuture = ref.watch(scenesNotifierProvider);
    return scenesFuture.when(
        error: (e, s) => PhraseForm(
              phraseInput: const PhraseInput.pure(),
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        loading: () => PhraseForm(
              phraseInput: const PhraseInput.pure(),
              scenesInput: const ScenesInput.pure(),
              isValid: false,
            ),
        data: (scenes) {
          final initialScenesMap = {for (var scene in scenes) scene.id: false};
          return PhraseForm(
            phraseInput: const PhraseInput.pure(),
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
