part of dmcb_core;

class DmcbLogConfig {
  /// Whether to display the log in reverse order
  final bool reverse;

  /// Whether or not to print logs in the ide
  final bool printNet;

  /// Whether or not to print net logs in the ide
  final bool printLog;

  /// Maximum number of logs, larger than this number, will be cleaned up, default value 500
  final int maxLimit;

  DmcbLogConfig({
    this.reverse = true,
    this.printNet = true,
    this.printLog = true,
    this.maxLimit = 100,
  });
}
