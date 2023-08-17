/// json数据map
@Deprecated("下版本将移除,请使用d_json库")
class DJsonMap {
  /// 数据
  final dynamic value;

  /// 初始化
  DJsonMap(this.value);

  /// 下标操作符
  DJsonMap operator [](dynamic key) {
    if (value is Map) return DJsonMap((value as Map)[key]);
    if (value is List) return DJsonMap((value as List).asMap()[key]);
    return DJsonMap(null);
  }

  /// 原始数据
  dynamic get v => value;

  /// String,类型匹配才有值
  String? get string => value is String ? value as String? : null;

  /// num,类型匹配才有值
  num? get number => value is num ? value as num? : null;

  /// int，类型匹配才有值
  int? get intValue => number?.toInt();

  /// double,类型匹配才有值
  double? get doubleValue => number?.toDouble();

  /// Map, 类型匹配才有值
  Map<dynamic, dynamic>? get map => value is Map ? value as Map? : null;

  /// List, 类型匹配才有值
  List<dynamic>? get list => value is List ? value as List? : null;

  /// bool,类型匹配才有值
  bool? get boolValue => value is bool ? value as bool : null;

  ///
  bool get boolean => value is bool ? value as bool : false;

  /// 获取int值，类型匹配才有值，默认0
  int get intOrZero => intValue ?? 0;

  /// 获取String值，类型匹配才有值，默认''
  String get stringOrEmpty => string ?? '';

  /// 获取double值，类型匹配才有值，默认0
  double get doubleOrZero => doubleValue ?? 0;

  /// 获取map值，类型匹配才有值，默认{}
  Map<dynamic, dynamic> get mapOrBlank => map ?? {};

  /// 获取List值，类型匹配才有值，默认[]
  List<dynamic> get listOrBlank => list ?? [];

  /// String/int/double类型，强制转换int
  int? get forceInt => toDouble?.toInt();

  /// String/num类型，强制转换num
  num? get toNum {
    return number ?? (string == null ? null : num.tryParse(string!));
  }

  /// String/int类型，强制转换int
  int? get toInt {
    return intValue ?? (string == null ? null : int.tryParse(string!));
  }

  /// String/double类型，强制转换double
  double? get toDouble {
    return doubleValue ?? intValue?.toDouble() ?? (string == null ? null : double.tryParse(string!));
  }

  /// String/double/int/bool类型，强制转换String
  String? get toStr {
    if (string != null) {
      return string!;
    } else {
      if (toInt != null) {
        return '${toInt!}';
      } else if (toDouble != null) {
        return '${toDouble!}';
      } else if (boolValue != null) {
        return '${boolValue!}';
      } else {
        return null;
      }
    }
  }

  /// 字符串时间转换成DateTime对象
  DateTime? get dateTime => DateTime.tryParse(string ?? '');

  /// 秒时间戳转换成DateTime对象
  DateTime? get dateTimeFromSecond => forceInt != null ? DateTime.fromMillisecondsSinceEpoch(forceInt! * 1000) : null;

  /// 豪秒时间戳转换成DateTime对象
  DateTime? get dateTimeFromMillisecond => forceInt != null ? DateTime.fromMillisecondsSinceEpoch(forceInt!) : null;

  /// 微秒时间戳转换成DateTime对象
  DateTime? get dateTimeFromMicrosecond => forceInt != null ? DateTime.fromMicrosecondsSinceEpoch(forceInt!) : null;

  /// 是否为空
  bool isEmpty() {
    if (v == null) return true;
    if (string == '') return true;
    if (number == 0) return true;
    if (map?.keys.isEmpty == true) return true;
    if (list?.isEmpty == true) return true;
    if (boolean == false) return true;
    return false;
  }

  /// 是否有值
  bool get hasValue => !isEmpty();

  @override
  String toString() => '<SafeMap:$value>';
}
