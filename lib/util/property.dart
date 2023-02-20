import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import 'dart:io';

mixin DProperty {
  /// 是否是性能模式
  bool get isProfile => kProfileMode;

  /// 是否是调试模式
  bool get isDebug => kDebugMode;

  /// 是否是调试模式
  bool get isRelease => kReleaseMode;

  /// 是否web
  bool get isWeb => kIsWeb;

  /// 是否iOS平台
  bool get isIOS => Platform.isIOS;

  /// 是否Android平台
  bool get isAndroid => Platform.isAndroid;

  /// 是否MacOS平台
  bool get isMacOS => Platform.isMacOS;

  /// 是否Windows平台
  bool get isWindows => Platform.isWindows;

  /// 像素密度
  double get pixelRatio => ui.window.devicePixelRatio;

  /// 屏幕大小
  ui.Size get size => ui.window.physicalSize / pixelRatio;

  /// 屏幕宽度
  double get width => size.width;

  /// 屏幕高度
  double get height => size.height;

  /// 顶部状态栏高度
  double get statusBarHeight => ui.window.padding.top / pixelRatio;

  /// 底部安全区域高度
  double get bottomBarHeight => ui.window.padding.bottom / pixelRatio;

  /// 是否暗黑模式
  bool get isPlatformDarkMode => (ui.window.platformBrightness == ui.Brightness.dark);
}
