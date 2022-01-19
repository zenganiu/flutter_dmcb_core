import 'package:flutter/cupertino.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

class LogEntity {
  static final List<LogEntity> list = [];
  static final ValueNotifier<int> length = ValueNotifier(0);
  static final Map<Object, Object> _map = {};

  final LogType type;
  final String title;
  final String message;
  final DateTime start;
  bool showDetail;
  LogEntity({
    this.type = LogType.log,
    this.title = '',
    this.message = '',
    this.showDetail = false,
    required this.start,
  });

  static void add({
    LogType type = LogType.log,
    String title = '',
    required Object content,
  }) {
    final log = LogEntity(
      type: type,
      title: title,
      message: content.toString(),
      start: DateTime.now(),
    );
    list.add(log);
    _clearWhenTooMuch();
    length.value++;
    if (DLogger.config.printLog) {
      final StringBuffer sb = StringBuffer();
      sb.writeln("${log.type.printFlag()}[${log.start.toString()}][${DmcbLogUtil.getNavigationFile()}]");
      if (log.title.isNotEmpty) sb.writeln(title);
      sb.writeln("\nData:${DmcbLogUtil.convertJsonString(content)}");
      debugPrint(sb.toString());
    }
  }

  static void _clearWhenTooMuch() {
    if (list.length > DLogger.config.maxLimit) {
      list.removeRange(0, (DLogger.config.maxLimit * 0.2).ceil());
    }
  }

  static void clear() {
    list.clear();
    _map.clear();
    length.value = 0;
  }

  bool contains(String keyword) {
    if (keyword.isEmpty) return true;
    return message.contains(keyword) || title.contains(keyword);
  }

  @override
  String toString() {
    final StringBuffer sb = StringBuffer();
    sb.writeln("Time: $start");
    sb.writeln('title: $title');
    sb.writeln("Message: $message");
    return sb.toString();
  }
}
