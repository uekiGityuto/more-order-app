import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';

part 'phrase.freezed.dart';

@freezed
abstract class Phrase implements _$Phrase {
  const Phrase._();

  const factory Phrase({
    required Id id,
    required String phrase,
  }) = _Phrase;

  // フィールドとしてscenesを持ちたいが、循環参照になるので、メソッドとして持たせている。
  List<Scene> getScenesOfBelonging(List<Scene> allScenes) {
    return allScenes.where((scene) {
      return scene.phrases.any((phrase) => phrase.id == id);
    }).toList();
  }
}
