part of flutter_dmcb_core;

class AppException implements Exception {
  // 错误描述信息
  final String? message;

  // 错误码
  final String code;

  AppException({required this.code, this.message});

  @override
  String toString() {
    return message ?? '未知错误';
  }
}
