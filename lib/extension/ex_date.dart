part of dmcb_core;

extension ExDate on DateTime {
  /// 当前时间是否今天
  bool get isToday {
    final cur = DateTime.now();
    return (cur.year == year && cur.month == month && cur.day == day);
  }

  /// 格式化输出时间字符串
  String toFormat({String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
    final format = DateFormat(pattern);
    return format.format(this);
  }
}
