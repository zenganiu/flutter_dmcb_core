import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dmcb_core/extension/ex_string.dart';

mixin DMethod {
  /// 强制退出应用
  void forceExitApp() => exit(0);

  /// 转换成json字符串,失败将返回defValue
  String? jsonEncode(Object? value, {String? defValue}) {
    try {
      final res = convert.jsonEncode(value);
      return res;
    } catch (e) {
      return defValue;
    }
  }

  /// json解码,失败返回null
  dynamic jsonDecode(String value) {
    try {
      final res = convert.jsonDecode(value);
      return res;
    } catch (e) {
      return null;
    }
  }

  /// 获取剪切板内容
  Future<String> getClipboardText() async {
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
  Color fromHex(String hex, {Color defaultColor = Colors.black}) {
    return hex.dmToColor(defaultColor: defaultColor);
  }
}
