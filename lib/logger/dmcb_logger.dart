part of flutter_dmcb_core;

abstract class DLogger {
  const DLogger._();

  static bool enabled = true;
  static DmcbLogConfig config = DmcbLogConfig();

  /// Logging
  static void log(Object message, {String title = ''}) {
    if (enabled) {
      LogEntity.add(type: LogType.log, content: message, title: title);
    }
  }

  /// Record debug information
  static void debug(Object message, {String title = ''}) {
    if (enabled) {
      LogEntity.add(type: LogType.debug, content: message, title: title);
    }
  }

  /// Record warning information
  static void warn(Object message, {String title = ''}) {
    if (enabled) {
      LogEntity.add(type: LogType.warn, content: message, title: title);
    }
  }

  /// Record error information
  static void error(Object message, {String title = ''}) {
    if (enabled) {
      LogEntity.add(type: LogType.error, content: message, title: title);
    }
  }

  /// Clearance log
  static void clear() {
    LogEntity.clear();
    NetEntity.clear();
  }

  /// Recording network information
  static void net({
    required String api,
    String url = '',
    String method = '',
    Object headers = '',
    Object parameters = '',
    Object responseBody = '',
    int spendTime = 0,
    int statusCode = 100,
    bool showDetail = false,
  }) {
    if (enabled) {
      NetEntity.net(
        type: NetType.http,
        api: api,
        url: url,
        method: method,
        headers: DmcbLogUtil.convertJsonString(headers),
        parameters: DmcbLogUtil.convertJsonString(parameters),
        responseBody: DmcbLogUtil.convertJsonString(responseBody),
        spendTime: spendTime,
        statusCode: statusCode,
        showDetail: showDetail,
      );
    }
  }
}

