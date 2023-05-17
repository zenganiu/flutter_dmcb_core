library flutter_dmcb_core;

extension DcmbExList<E> on List<E> {
  /// 安全的获取首个元素
  E? get dmSafeFirst {
    if (isEmpty) return null;
    return first;
  }

  /// 安全的获取最后一个元素
  E? get dmSafeLast {
    if (isEmpty) return null;
    return last;
  }

  /// 安全的获取索引对应的元素
  E? dmSafeIndex(int idx) {
    if (isEmpty) return null;
    if (length <= idx) {
      return null;
    }
    return this[idx];
  }
}
