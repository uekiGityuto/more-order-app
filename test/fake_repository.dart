import 'package:more_order_app/domain/entity/payment_method.dart';
import 'package:more_order_app/domain/entity/phrase.dart';
import 'package:more_order_app/domain/entity/reason.dart';
import 'package:more_order_app/domain/entity/scene.dart';
import 'package:more_order_app/domain/repository/repository.dart';

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
  Future<List<Scene>> fetchScenesAndPhrases() async {
    return scenes;
  }

  @override
  Future<int> countPhrases() async {
    var phraseSet = <Phrase>{};
    for (var s in scenes) {
      phraseSet.addAll(s.phrases.toSet());
    }
    return phraseSet.length;
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
  Future<List<Reason>> fetchReasons() async {
    return reasons;
  }

  @override
  Future<int> countReasons() async {
    return reasons.length;
  }

  @override
  Future<void> addReason(String reason, bool isDefault) async {
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
  Future<int> countScenes() async {
    return scenes.length;
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
  Future<List<PaymentMethod>> fetchPaymentMethods() async {
    return paymentMethods;
  }

  @override
  Future<int> countPaymentMethods() async {
    return paymentMethods.length;
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
