import 'dart:async';

import 'package:flutter_dmcb_core/extension/ex_date.dart';
import 'package:intl/intl.dart';

typedef DOnTimerCountdownCallback = void Function(int millisUntilFinished);

/// 倒计时
class DTimerCountdown {
  /// 定时器
  Timer? _mTimer;

  /// Timer是否启动.
  bool _isActive = false;

  /// Timer间隔 单位毫秒，默认1000毫秒(1秒).
  int _duration;

  /// 倒计时总时间,单位毫秒
  int _totalTime;

  /// 定时器回调
  DOnTimerCountdownCallback? _onTimerCountdownCallback;

  /// 初始化
  DTimerCountdown({
    int duration = Duration.millisecondsPerSecond,
    int totalTime = 0,
  })  : _duration = duration,
        _totalTime = totalTime;

  /// 设置Timer间隔
  ///
  /// [interval] 间隔,单位毫秒,小于0将默认1秒
  void setDuration(int interval) {
    assert(interval > 0, '间隔应该大于0');
    if (interval <= 0) interval = Duration.millisecondsPerSecond;
    _duration = interval;
  }

  void setDurationFromSecond(int interval) {
    assert(interval > 0, '间隔应该大于0');
    if (interval <= 0) interval = Duration.millisecondsPerSecond;
    _duration = Duration(seconds: interval).inMilliseconds;
  }

  /// 设置倒计时
  ///
  /// [totalTime] 总时间,单位毫秒,
  void setTotalTime(int totalTime) {
    assert(totalTime > 0, '总时间应该大于0');
    if (totalTime <= 0) return;
    _totalTime = totalTime;
  }

  void stop() {
    if (_isActive) {
      _mTimer?.cancel();
    }
  }

  /// 启动倒计时Timer.
  void startCountDown() {
    if (_isActive || _duration <= 0 || _totalTime <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: _duration);
    _doCallback(_totalTime);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      int time = _totalTime - _duration;
      _totalTime = time;
      if (time >= _duration) {
        _doCallback(time);
      } else if (time == 0) {
        _doCallback(time);
        cancel();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          _totalTime = 0;
          _doCallback(0);
          cancel();
        });
      }
    });
  }

  void setOnTimerCountdownCallback(void Function(int) callback) {
    _onTimerCountdownCallback = callback;
  }

  void _doCallback(int time) {
    if (_onTimerCountdownCallback != null) {
      _onTimerCountdownCallback!(time);
    }
  }

  /// Timer是否启动.
  bool get isActive => _isActive;

  /// 取消计时器.
  void cancel() {
    _mTimer?.cancel();
    _mTimer = null;
    _isActive = false;
  }
}

/// 倒计时输入格式
enum DTimerCountdownFormat {
  /// 时分秒
  hourMinuteSecond,

  /// 分秒
  minuteSecond,

  /// 秒
  second,
}

extension ExCountdownFormat on DTimerCountdownFormat {
  String format(int millisUntilFinished) {
    final seconds = millisUntilFinished ~/ 1000;
    switch (this) {
      case DTimerCountdownFormat.hourMinuteSecond:
        final hour = (seconds ~/ 3600).floor();
        final minute = ((seconds / 60) % 60).floor();
        final second = (seconds % 60).floor();
        final formatter = NumberFormat('00');
        return '$hour:${formatter.format(minute)}:${formatter.format(second)}';
      case DTimerCountdownFormat.minuteSecond:
        final minute = (seconds ~/ 60).floor();
        final second = (seconds % 60).floor();
        final formatter = NumberFormat('00');
        return '$minute:${formatter.format(second)}';
      case DTimerCountdownFormat.second:
        return '${seconds.floor()}';
    }
  }
}
