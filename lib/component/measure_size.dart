import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// 测量子组件大小
class DMeasureSize extends StatefulWidget {
  /// 子组件
  final Widget child;

  /// 回调函数
  final void Function(Size) onChange;

  /// 初始化
  const DMeasureSize({
    super.key,
    required this.onChange,
    required this.child,
  });

  @override
  State<DMeasureSize> createState() => _DMeasureSizeState();
}

class _DMeasureSizeState extends State<DMeasureSize> {
  final widgetKey = GlobalKey();

  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  void postFrameCallback(_) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final newSize = context.size;
    if (oldSize == newSize || newSize == null) return;

    oldSize = newSize;
    widget.onChange(newSize);
  }
}
