import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_order_app/domain/errors/error.dart';

part 'error.g.dart';

@riverpod
class ErrorNotifier extends _$ErrorNotifier {
  @override
  ErrorType build() {
    return ErrorType.none;
  }

  void updateState(ErrorType error) {
    state = error;
  }
}
