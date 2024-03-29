import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/entity/phrase.dart';
import 'package:more_order/domain/valueObject/id.dart';

part 'scene.freezed.dart';

@freezed
abstract class Scene implements _$Scene {
  const Scene._();

  const factory Scene({
    required Id id,
    required String scene,
    required bool isDefault,
    required List<Phrase> phrases,
  }) = _Scene;
}
