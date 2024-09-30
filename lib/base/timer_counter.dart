import 'dart:async';

typedef DOnTimerCounterCallback = void Function(int count);

/// 计时器
class DTimerCounter {
  /// 定时器
  Timer? _mTimer;

  /// Timer是否启动.
  bool _isActive = false;

  /// Timer间隔 单位毫秒，默认1000毫秒(1秒).
  final int _interval;

  /// 计数
  int _count = 0;

  /// 定时器回调
  DOnTimerCounterCallback? _onTimerCounterCallback;

  /// 构造函数
  DTimerCounter({int interval = 1000}) : _interval = interval;

  /// Timer是否启动.
  bool get isActive => _isActive;

  /// 启动计时Timer.
  void startCounter() {
    if (_isActive || _interval <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: _interval);
    _doCallback(_count);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      _count += 1;
      _doCallback(_count);
    });
  }

  /// 暂停
  void stop() {
    if (_isActive) {
      _mTimer?.cancel();
    }
  }

  /// 重置
  void reset() {
    stop();
    _count = 0;
  }

  /// 计时器回调
  void setOnTimerCounterCallback(void Function(int) callback) {
    _onTimerCounterCallback = callback;
  }

  void _doCallback(int count) {
    _onTimerCounterCallback?.call(count);
  }

  /// 取消计时器.
  void cancel() {
    _mTimer?.cancel();
    _mTimer = null;
    _isActive = false;
  }
}
