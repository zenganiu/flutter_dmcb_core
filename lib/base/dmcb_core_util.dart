part of flutter_dmcb_core;

abstract class DUtils {
  /// 是否是性能模式
  static bool get isProfile {
    return kProfileMode;
  }

  /// 是否是调试模式
  static bool get isDebug {
    return kDebugMode;
  }

  /// 是否是调试模式
  static bool get isRelease {
    return kReleaseMode;
  }

  /// 是否web
  static bool get isWeb {
    return kIsWeb;
  }

  /// 强制退出应用
  static void forceExitApp() {
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

  /// hex颜色
  static Color formHex(String hex, {Color defaultColor = Colors.black}) {
    return hex.toColor(defaultColor: defaultColor);
  }
}
