import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/entity/phrase.dart';
import 'package:more_order/domain/valueObject/id.dart';

part 'phrase.freezed.dart';
part 'phrase.g.dart';

@freezed
abstract class PhraseDTO implements _$PhraseDTO {
  const PhraseDTO._();

  const factory PhraseDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'phrase') required String phrase,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Phrase;

  factory PhraseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhraseDTOFromJson(json);

  Phrase toEntity() {
    return Phrase(
      id: Id(value: id),
      phrase: phrase,
    );
  }
}
