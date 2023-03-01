library flutter_dmcb_core;

extension DcmbExList<E> on List<E> {
  /// 安全的获取首个元素
  E? get dmSafeFirst {
    if (isEmpty) return null;
    return first;
  }

  @Deprecated('使用`dmSafeFirst`代替')
  E? get safeFirst {
    return dmSafeFirst;
  }

  /// 安全的获取最后一个元素
  E? get dmSafeLast {
    if (isEmpty) return null;

    return last;
  }

  @Deprecated('使用`dmSafeLast`代替')
  E? get safeLast {
    return dmSafeLast;
  }

  /// 安全的获取索引对应的元素
  E? dmSafeIndex(int idx) {
    if (isEmpty) return null;
    if (length <= idx) {
      return null;
    }
    return this[idx];
  }

  @Deprecated('使用`dmSafeIndex`代替')
  E? safeIndex(int idx) {
    return dmSafeIndex(idx);
  }
}
