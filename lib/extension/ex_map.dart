import 'dart:convert' as convert;

/// 对map的扩展
extension DcmbExMap<K, V> on Map<K, V> {
  /// 转json字符串,失败将返回{}
  String get dmToJsonStr {
    try {
      return convert.jsonEncode(this);
    } catch (e) {
      return '{}';
    }
  }

  @Deprecated('使用`dmToJsonStr`代替')
  String get toJsonStr {
    return dmToJsonStr;
  }
}
