part of dmcb_core;
extension ExList<E> on List<E> {
  /// 获取列表首个元素，不存在返回null
  E? get safeFirst {
    if (isEmpty) return null;

    return first;
  }

  /// 获取列表最后一个元素，不存在返回null
  E? get safeLast {
    if (isEmpty) return null;

    return last;
  }
}
