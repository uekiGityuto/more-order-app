enum MaxAddCount {
  phrase(30),
  scene(5),
  reason(5),
  paymentMethod(5),
  ;

  const MaxAddCount(this.count);

  final int count;
}

extension MaxAddCountExtension on MaxAddCount {
  bool isOver(int count) {
    return count >= this.count;
  }
}
