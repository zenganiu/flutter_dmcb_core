part of flutter_dmcb_core;

extension ExColor on Color {
  /// 获取hex颜色
  String get toHexString {
    final sb = StringBuffer();
    sb.write('#');
    sb.write(red.toRadixString(16).padLeft(2, '0'));
    sb.write(green.toRadixString(16).padLeft(2, '0'));
    sb.write(blue.toRadixString(16).padLeft(2, '0'));
    return sb.toString();
  }
}
