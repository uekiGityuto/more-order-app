import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order_app/domain/entity/scene.dart';
import 'package:more_order_app/domain/valueObject/id.dart';
import 'package:more_order_app/infrastructure/db/dto/phrase.dart';

part 'scene.freezed.dart';
part 'scene.g.dart';

@freezed
abstract class SceneDTO implements _$SceneDTO {
  const SceneDTO._();

  const factory SceneDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'scene') required String scene,
    @JsonKey(name: 'is_default') required int isDefault,
    @Default([]) @JsonKey(name: 'phrases') List<PhraseDTO> phrases,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Scene;

  factory SceneDTO.fromJson(Map<String, dynamic> json) =>
      _$SceneDTOFromJson(json);

  Scene toEntity() {
    return Scene(
        id: Id(value: id),
        scene: scene,
        isDefault: isDefault == 1 ? true : false,
        phrases: phrases.map((done) => done.toEntity()).toList());
  }
}
