library flutter_dmcb_core;

class AppException implements Exception {
  // 错误描述信息
  final String? message;

  // 错误码
  final String code;

  // 额外参数
  final Object? extraData;

  AppException({required this.code, this.message, this.extraData});

  @override
  String toString() {
    return message ?? '未知错误';
  }
}
