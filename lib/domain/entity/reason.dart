import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:more_order/domain/valueObject/id.dart';

part 'reason.freezed.dart';

@freezed
abstract class Reason implements _$Reason {
  const Reason._();

  const factory Reason({
    required Id id,
    required String reason,
    required bool isDefault,
  }) = _Reason;
}
