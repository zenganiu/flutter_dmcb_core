library flutter_dmcb_core;

import 'package:intl/intl.dart';

extension DcmbExDate on DateTime {
  /// 当前时间是否今天
  bool get dmIsToday {
    final cur = DateTime.now();
    return (cur.year == year && cur.month == month && cur.day == day);
  }

  /// 格式化输出时间字符串
  ///
  /// [pattern] 模式，默认yyyy-MM-dd HH:mm:ss
  String dmFormat({String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
    final format = DateFormat(pattern);
    return format.format(this);
  }

  /// 时间是否是过去
  bool get dmIsPast => isBefore(DateTime.now());
}
