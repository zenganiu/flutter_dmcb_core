part of dmcb_core;

enum NetType {
  http,
  socket,
}

extension DcmbLoggerBWM on NetType {
  String printFlag() {
    switch (this) {
      case NetType.http:
        return "⬆️";
      case NetType.socket:
        return "↕️";
      default:
        return "#";
    }
  }

  String tabFlag() {
    switch (this) {
      case NetType.http:
        return "[http]";
      case NetType.socket:
        return "[socket]";
      default:
        return "&&";
    }
  }
}
