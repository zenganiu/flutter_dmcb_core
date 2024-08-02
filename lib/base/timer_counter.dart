import 'dart:async';

typedef DOnTimerCounterCallback = void Function(int count);

/// 计时器
class DTimerCounter {
  /// 定时器
  Timer? _mTimer;

  /// Timer是否启动.
  bool _isActive = false;

  /// Timer间隔 单位毫秒，默认1000毫秒(1秒).
  final int _duration;

  /// 计数
  int _count = 0;

  /// 定时器回调
  DOnTimerCounterCallback? _onTimerCounterCallback;

  DTimerCounter({int duration = 1000}) : _duration = duration;

  /// 启动计时Timer.
  void startCounter() {
    if (_isActive || _duration <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: _duration);
    _doCallback(_count);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      _count += 1;
      _doCallback(_count);
    });
  }

  void stop() {
    if (_isActive) {
      _mTimer?.cancel();
    }
  }

  void setOnTimerCounterCallback(void Function(int) callback) {
    _onTimerCounterCallback = callback;
  }

  void _doCallback(int count) {
    _onTimerCounterCallback?.call(count);
  }

  /// Timer是否启动.
  bool get isActive => _isActive;

  /// 取消计时器.
  void cancel() {
    _mTimer?.cancel();
    _mTimer = null;
    _isActive = false;
    _count = 0;
  }
}
