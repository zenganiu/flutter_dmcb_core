import 'dart:convert' as convert;

/// 对map的扩展
extension DcmbExMap<K, V> on Map<K, V> {
  /// 转json字符串,失败将返回{}
  String get toJsonStr {
    try {
      return convert.jsonEncode(this);
    } catch (e) {
      return '{}';
    }
  }
}