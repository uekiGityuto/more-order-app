enum ErrorType {
  none(''),
  phraseDuplicate('このフレーズは既に存在しています。'),
  reasonDuplicate('この理由は既に存在しています。'),
  sceneDuplicate('この場面は既に存在しています。'),
  paymentMethodDuplicate('この支払方法は既に存在しています。'),
  defaultSceneDelete('この場面は削除できません。'),
  defaultSceneEdit('この場面は編集できません。'),
  phraseCountOver('フレーズの登録数が上限に達しています。'),
  sceneCountOver('場面の登録数が上限に達しています。'),
  reasonCountOver('理由の登録数が上限に達しています。'),
  paymentMethodCountOver('支払方法の登録数が上限に達しています。'),
  unexpected("システムエラーが発生しました。"),
  ;

  const ErrorType(this.message);

  final String message;
}

class DomainException implements Exception {
  final ErrorType type;
  const DomainException(this.type);

  @override
  String toString() => type.message;
}
