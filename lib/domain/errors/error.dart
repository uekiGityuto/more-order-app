enum ErrorType {
  none(''),
  phraseDuplicate('このフレーズは既に存在しています。'),
  reasonDuplicate('この理由は既に存在しています。'),
  sceneDuplicate('この場面は既に存在しています。'),
  defaultSceneDelete('この場面は削除できません。'),
  defaultSceneEdit('この場面は編集できません。'),
  unexpected("システムエラーが発生しました。");

  const ErrorType(this.message);

  final String message;
}

class DomainException implements Exception {
  final ErrorType type;
  const DomainException(this.type);

  @override
  String toString() => type.message;
}
