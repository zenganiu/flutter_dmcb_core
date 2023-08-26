import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dmcb_core/extension/ex_date.dart';
import 'package:flutter_dmcb_core/extension/ex_string.dart';
import 'package:intl/intl.dart';

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

  /// 格式化金额
  String moneyFormat(double amount, {String format = "#,##0.00"}) {
    NumberFormat fm = NumberFormat(format);
    return fm.format(amount);
  }

  /// 格式化时间,不符合将返回原值
  String dateFormat(dynamic dateTime, {String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
    var fm = dateTime.toString();
    if (dateTime is String) {
      final date = DateTime.tryParse(dateTime);
      if (date != null) {
        return date.dmFormat(pattern: pattern);
      }
    } else if (dateTime is DateTime) {
      return dateTime.dmFormat(pattern: pattern);
    }
    return fm;
  }
}
