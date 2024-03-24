import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/entity/reason.dart';
import 'package:more_order/domain/valueObject/id.dart';

part 'reason.freezed.dart';
part 'reason.g.dart';

@freezed
abstract class ReasonDTO implements _$ReasonDTO {
  const ReasonDTO._();

  const factory ReasonDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'reason') required String reason,
    @JsonKey(name: 'is_default') required int isDefault,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Reason;

  factory ReasonDTO.fromJson(Map<String, dynamic> json) =>
      _$ReasonDTOFromJson(json);

  Reason toEntity() {
    return Reason(
      id: Id(value: id),
      reason: reason,
      isDefault: isDefault == 1 ? true : false,
    );
  }
}
