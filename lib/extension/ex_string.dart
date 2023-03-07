library flutter_dmcb_core;

import 'dart:convert' as convert;

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

extension DcmbExString on String {
  /// 是否是空
  bool get dmIsBlank => trim().isEmpty;

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

  /// md5加密
  String dmToMD5() {
    var content = const convert.Utf8Encoder().convert(this);
    var digest = md5.convert(content);
    return digest.toString();
  }

  /// 转为int
  int? dmToInt() {
    try {
      return int.tryParse(this);
    } catch (e) {
      return null;
    }
  }

  /// 转为double
  double? dmToDouble() {
    try {
      return double.tryParse(this);
    } catch (e) {
      return null;
    }
  }

  /// 是否是手机号码
  bool dmIsPhone() {
    return dmRegExpMatch(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
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

  /// 反转字符串
  String dmReverse() {
    if (isEmpty) return '';
    StringBuffer sb = StringBuffer();
    for (int i = length - 1; i >= 0; i--) {
      sb.writeCharCode(codeUnitAt(i));
    }
    return sb.toString();
  }

  /// 移除所有空格
  String dmTrimAll() {
    return replaceAll(RegExp(r"\s+\b|\b\s"), "");
  }

  /// 正则判断
  bool dmRegExpMatch(String expStr) {
    RegExp exp = RegExp(expStr);
    return exp.hasMatch(this);
  }

  /// 是否是正确的url
  bool get dmIsUrl {
    if (dmIsBlank) {
      return false;
    }
    final res = dmRegExpMatch(
        r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
    return res;
  }

  /// 是否是身份证号码
  bool get dmIsIDNumber {
    if (dmIsBlank) {
      return false;
    }
    final res = dmRegExpMatch(
        r'^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X|x)$');
    return res;
  }
}
