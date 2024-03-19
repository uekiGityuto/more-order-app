import 'package:more_order_app/domain/entity/payment_method.dart';
import 'package:more_order_app/domain/entity/phrase.dart';
import 'package:more_order_app/domain/entity/reason.dart';
import 'package:more_order_app/domain/entity/scene.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) =>
    throw UnimplementedError('Provider was not initialized');

abstract interface class Repository {
  Future<List<Scene>> getScenesAndPhrases();

  Future<int> countPhrases();
  Future<void> addPhrase(String phrase, List<Scene> scenes);
  Future<void> updatePhrase(
    Phrase phrase, {
    required List<Scene> deletedScenes,
    required List<Scene> addedScenes,
  });
  Future<void> deletePhrase(Phrase phrase);

  Future<List<Reason>> getReasons();
  Future<int> countReasons();
  Future<void> addReason(String reason, bool isDefault);
  Future<void> updateReason(Reason reason);
  Future<void> deleteReason(Reason reason);

  Future<int> countScenes();
  Future<void> addScene(String scene);
  Future<void> updateScene(Scene scene);
  Future<void> deleteScene(Scene scene);

  Future<List<PaymentMethod>> getPaymentMethods();
  Future<int> countPaymentMethods();
  Future<void> addPaymentMethod(String method, bool isDefault);
  Future<void> updatePaymentMethod(PaymentMethod paymentMethod);
  Future<void> deletePaymentMethod(PaymentMethod paymentMethod);
}
