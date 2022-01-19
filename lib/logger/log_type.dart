part of flutter_dmcb_core;

enum LogType { log, debug, warn, error }

extension DcmbLoggerBYD on LogType {
  String printFlag() {
    switch (this) {
      case LogType.log:
        return "😄";
      case LogType.debug:
        return "🐛";
      case LogType.warn:
        return "❗";
      case LogType.error:
        return "❌";
      default:
        return "#";
    }
  }

  String tabFlag() {
    switch (this) {
      case LogType.log:
        return "[Log]";
      case LogType.debug:
        return "[Debug]";
      case LogType.warn:
        return "[Warn]";
      case LogType.error:
        return "[Error]";
      default:
        return "##";
    }
  }

  Color color() {
    switch (this) {
      case LogType.debug:
        return Colors.blue;
      case LogType.warn:
        return const Color(0xFFF57F17);
      case LogType.error:
        return Colors.red;
      default:
        return Colors.black38;
    }
  }
}
