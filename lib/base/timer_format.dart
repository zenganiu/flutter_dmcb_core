import 'package:intl/intl.dart';

/// Timer输出格式
enum DTimerFormat {
  /// 时/分/秒, 00:00:00
  hourMinuteSecond,

  /// 分/秒,00:00
  minuteSecond,

  /// 秒,0
  second,

  /// 分/秒/毫秒,00:00:000
  minuteSecondMilliseconds,

  /// 时/分/秒/毫秒, 00:00:00:000
  hourMinuteSecondMilliseconds
}

extension ExDTimerFormat on DTimerFormat {
  /// 倒计时输出格式化
  /// [millisUntilFinished] 计时毫秒数
  String format(int millisUntilFinished) {
    int secondUntilFinished = millisUntilFinished ~/ 1000;
    switch (this) {
      case DTimerFormat.hourMinuteSecond:
        final hour = (secondUntilFinished ~/ 3600).floor();
        final minute = ((secondUntilFinished / 60) % 60).floor();
        final second = (secondUntilFinished % 60).floor();
        final formatter = NumberFormat('00');
        return '$hour:${formatter.format(minute)}:${formatter.format(second)}';
      case DTimerFormat.minuteSecond:
        final minute = (secondUntilFinished ~/ 60).floor();
        final second = (secondUntilFinished % 60).floor();
        final formatter = NumberFormat('00');
        return '$minute:${formatter.format(second)}';
      case DTimerFormat.second:
        return '${secondUntilFinished.floor()}';
      case DTimerFormat.minuteSecondMilliseconds:
        final milliseconds = millisUntilFinished % 1000;
        final minute = (secondUntilFinished ~/ 60).floor();
        final second = (secondUntilFinished % 60).floor();
        final formatter = NumberFormat('00');
        return '$minute:${formatter.format(second)}:${NumberFormat('000').format(milliseconds)}';
      case DTimerFormat.hourMinuteSecondMilliseconds:
        final milliseconds = millisUntilFinished % 1000;
        final hour = (secondUntilFinished ~/ 3600).floor();
        final minute = ((secondUntilFinished / 60) % 60).floor();
        final second = (secondUntilFinished % 60).floor();
        final formatter = NumberFormat('00');
        return '$hour:${formatter.format(minute)}:${formatter.format(second)}:${NumberFormat('000').format(milliseconds)}';
    }
  }

  /// 倒计时输出格式化
  /// [secondUntilFinished] 计时秒数
  String formatWithSeconds(int secondUntilFinished) {
    final seconds = secondUntilFinished * 1000;
    return format(seconds);
  }
}
