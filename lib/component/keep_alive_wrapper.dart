import 'package:flutter/material.dart';

/// 页面缓存功能组件
class DKeepAliveWrapper extends StatefulWidget {
  /// 是否保活
  final bool keepAlive;
  final Widget child;

  const DKeepAliveWrapper({
    super.key,
    this.keepAlive = true,
    required this.child,
  });

  @override
  State<DKeepAliveWrapper> createState() => _DKeepAliveWrapperState();
}

class _DKeepAliveWrapperState extends State<DKeepAliveWrapper> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant DKeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
