import 'package:flutter/material.dart';

/// 页面缓存功能组件
class DKeepAliveWrapper extends StatefulWidget {
  final bool keepAlive;
  final Widget child;
  const DKeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);

  @override
  _DKeepAliveWrapperState createState() => _DKeepAliveWrapperState();
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
