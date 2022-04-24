import 'package:flutter/foundation.dart';
import 'dart:ui' as ui;
import 'util.dart';

mixin DProperty {
  /// 是否是性能模式
  bool get isProfile => kProfileMode;

  /// 是否是调试模式
  bool get isDebug => kDebugMode;

  /// 是否是调试模式
  bool get isRelease => kReleaseMode;

  /// 是否web
  bool get isWeb => kIsWeb;

  double get pixelRatio => ui.window.devicePixelRatio;
  ui.Size get size => ui.window.physicalSize / pixelRatio;
  double get width => size.width;
  double get height => size.height;
  double get statusBarHeight => ui.window.padding.top / pixelRatio;
  double get bottomBarHeight => ui.window.padding.bottom / pixelRatio;
  bool get isPlatformDarkMode => (ui.window.platformBrightness == ui.Brightness.dark);
}
