part of dmcb_core;

abstract class DUtils {
  /// 强制退出应用
  static void forceExit() {
    exit(0);
  }

  /// 转换成json字符串
  static String convertJsonString(Object value) {
    try {
      final jsStr = json.encode(value);
      return jsStr;
    } catch (e) {
      final jsStr = value.toString();
      return jsStr;
    }
  }

  /// 获取剪切板内容
  static Future<String> getClipboardText() async {
    try {
      final clipboardData = await Clipboard.getData('text/plain');
      if (clipboardData != null) {
        return clipboardData.text ?? '';
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}
