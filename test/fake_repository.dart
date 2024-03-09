import 'package:smart_order_app/domain/entity/payment_method.dart';
import 'package:smart_order_app/domain/entity/phrase.dart';
import 'package:smart_order_app/domain/entity/reason.dart';
import 'package:smart_order_app/domain/entity/scene.dart';
import 'package:smart_order_app/domain/repository/repository.dart';

class FakeRepository implements Repository {
  final List<Scene> scenes;
  final List<Reason> reasons;
  final List<PaymentMethod> paymentMethods;
  FakeRepository({
    this.scenes = const [],
    this.reasons = const [],
    this.paymentMethods = const [],
  });

  @override
  Future<List<Scene>> getScenesAndPhrases() async {
    return scenes;
  }

  @override
  Future<void> addPhrase(String phrase, List<Scene> scenes) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updatePhrase(Phrase phrase,
      {required List<Scene> deletedScenes,
      required List<Scene> addedScenes}) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deletePhrase(Phrase phrase) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<List<Reason>> getReasons() async {
    return reasons;
  }

  @override
  Future<void> addMethod(String reason, bool isDefault) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updateReason(Reason reason) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deleteReason(Reason reason) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> addScene(String scene) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updateScene(Scene scene) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deleteScene(Scene scene) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<List<PaymentMethod>> getPaymentMethods() async {
    return paymentMethods;
  }

  @override
  Future<void> addPaymentMethod(String method, bool isDefault) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> updatePaymentMethod(PaymentMethod paymentMethod) async {
    await Future.delayed(const Duration(seconds: 0));
  }

  @override
  Future<void> deletePaymentMethod(PaymentMethod paymentMethod) async {
    await Future.delayed(const Duration(seconds: 0));
  }
}
