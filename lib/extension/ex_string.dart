part of dmcb_core;

extension ExString on String {
  String sensorNoEmpty({String defaultValue = '无'}) {
    var str = this;
    if (str.isEmpty || str == 'null') {
      str = '无';
    }
    return str;
  }

  /// hex转换成Color对象
  Color toColor({Color defaultColor = Colors.black}) {
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

  // /// md5加密
  // String toMD5() {
  //   var content = const Utf8Encoder().convert(this);
  //   var digest = md5.convert(content);
  //   return digest.toString();
  // }

  /// 是否是手机号码
  bool isPhone() {
    return regExpMatch(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  }

  /// 正则判断
  bool regExpMatch(String expStr) {
    RegExp exp = RegExp(expStr);
    return exp.hasMatch(this);
  }
}
