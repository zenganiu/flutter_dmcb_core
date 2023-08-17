import 'dart:convert' as convert;

import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

/// 对map的扩展
extension DcmbExMap<K, V> on Map<K, V> {
  /// 转json字符串,失败将返回{}
  String get dmToJsonStr => DUtils.jsonEncode(this, defValue: '{}') ?? '{}';
}
