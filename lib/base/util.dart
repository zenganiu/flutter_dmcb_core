library flutter_dmcb_core;

import 'dart:convert' as convert;
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

abstract class DUtils {
  /// 是否是性能模式
  static bool get isProfile => kProfileMode;

  /// 是否是调试模式
  static bool get isDebug => kDebugMode;

  /// 是否是调试模式
  static bool get isRelease => kReleaseMode;

  /// 是否web
  static bool get isWeb => kIsWeb;

  static double get pixelRatio => ui.window.devicePixelRatio;
  static Size get size => ui.window.physicalSize / pixelRatio;
  static double get width => size.width;
  static double get height => size.height;
  static double get statusBarHeight => ui.window.padding.top / pixelRatio;
  static double get bottomBarHeight => ui.window.padding.bottom / pixelRatio;
  static bool get isPlatformDarkMode => (ui.window.platformBrightness == Brightness.dark);

  /// 强制退出应用
  static void forceExitApp() {
    exit(0);
  }

  /// 转换成json字符串
  static String convertJsonString(Object value) {
    try {
      final jsStr = convert.json.encode(value);
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
