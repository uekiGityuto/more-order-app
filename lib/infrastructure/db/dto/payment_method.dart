import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order_app/domain/entity/payment_method.dart';
import 'package:more_order_app/domain/valueObject/id.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
abstract class PaymentMethodDTO implements _$PaymentMethodDTO {
  const PaymentMethodDTO._();

  const factory PaymentMethodDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'method') required String method,
    @JsonKey(name: 'is_default') required int isDefault,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _PaymentMethod;

  factory PaymentMethodDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDTOFromJson(json);

  PaymentMethod toEntity() {
    return PaymentMethod(
      id: Id(value: id),
      method: method,
      isDefault: isDefault == 1 ? true : false,
    );
  }
}
