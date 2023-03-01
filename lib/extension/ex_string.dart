library flutter_dmcb_core;

import 'dart:convert' as convert;

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

extension DcmbExString on String {
  /// 字符串空处理 (''或null)
  ///
  /// [defaultValue] 默认值,默认: 无
  String dmSensorNoEmpty({String defaultValue = '无'}) {
    var str = this;
    if (str.isEmpty || str == 'null') {
      str = '无';
    }
    return str;
  }

  @Deprecated('使用`dmSensorNoEmpty`代替')
  String sensorNoEmpty({String defaultValue = '无'}) {
    return dmSensorNoEmpty(defaultValue: defaultValue);
  }

  /// hex转换成Color对象
  ///
  /// [defaultColor] 默认颜色，默认为黑色
  Color dmToColor({Color defaultColor = Colors.black}) {
    final sb = StringBuffer();
    if (length == 6 || length == 7) sb.write('ff');
    sb.write(replaceAll('#', ''));
    final hex = int.tryParse(sb.toString(), radix: 16);
    if (hex != null) {
      return Color(hex);
    } else {
      return defaultColor;
    }
  }

  @Deprecated('使用`dmToColor`代替')
  Color toColor({Color defaultColor = Colors.black}) {
    return dmToColor(defaultColor: defaultColor);
  }

  /// md5加密
  String dmToMD5() {
    var content = const convert.Utf8Encoder().convert(this);
    var digest = md5.convert(content);
    return digest.toString();
  }

  @Deprecated('使用`dmToMD5`代替')
  String toMD5() {
    return dmToMD5();
  }

  /// 转为int
  int? dmToInt() {
    try {
      return int.tryParse(this);
    } catch (e) {
      return null;
    }
  }

  @Deprecated('使用`dmToInt`代替')
  int? toInt() {
    return dmToInt();
  }

  /// 是否是手机号码
  bool dmIsPhone() {
    return dmRegExpMatch(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  }

  @Deprecated('使用`dmIsPhone`代替')
  bool isPhone() {
    return dmIsPhone();
  }

  /// 字符串替换
  ///
  /// [start] 起始位置
  /// [end] 结束位置
  /// [replacement] 替换内容
  String dmReplaceString({int start = 3, int end = 7, String replacement = '****'}) {
    if (start < 0 || length < end || start > end) return this;
    return replaceRange(start, end, replacement);
  }

  @Deprecated('使用`dmReplaceString`代替')
  String replaceString({int start = 3, int end = 7, String replacement = '****'}) {
    return dmReplaceString(start: start, end: end, replacement: replacement);
  }

  /// 反转字符串
  String dmReverse() {
    if (isEmpty) return '';
    StringBuffer sb = StringBuffer();
    for (int i = length - 1; i >= 0; i--) {
      sb.writeCharCode(codeUnitAt(i));
    }
    return sb.toString();
  }

  @Deprecated('使用`dmReverse`代替')
  String reverse() {
    return dmReverse();
  }

  /// 正则判断
  bool dmRegExpMatch(String expStr) {
    RegExp exp = RegExp(expStr);
    return exp.hasMatch(this);
  }

  @Deprecated('使用`dmRegExpMatch`代替')
  bool regExpMatch(String expStr) {
    return dmRegExpMatch(expStr);
  }

  /// 移除所有空格
  String dmTrimAll() {
    return replaceAll(RegExp(r"\s+\b|\b\s"), "");
  }

  @Deprecated('使用`dmTrimAll`代替')
  String trimAll() {
    return dmTrimAll();
  }
}
