import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/valueObject/id.dart';
import 'package:smart_order_app/ui/form/form_creation_status.dart';

part 'order_form.freezed.dart';

@freezed
class OrderForm with _$OrderForm {
  factory OrderForm({
    required FormCreationStatus creationStatus,
    required List<Reason>? reasons,
    required Id? reasonInput,
    required Scene? scene,
    required Map<Id, bool> phrasesInput,
  }) = _OrderForm;
}
