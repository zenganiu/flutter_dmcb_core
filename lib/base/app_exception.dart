class DAppException implements Exception {
  /// 错误码
  final String code;

  /// 错误描述信息
  final String? message;

  /// 额外参数
  final Object? extraData;

  /// 构造函数
  DAppException({required this.code, this.message, this.extraData});

  @override
  String toString() {
    return 'code: $code,\n message: ${message ?? '未知错误'} \n extraData: ${extraData.toString()}';
  }
}
