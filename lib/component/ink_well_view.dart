import 'package:flutter/material.dart';

/// 水波纹点击组件
class DInkWellView extends StatelessWidget {
  /// 子组件
  final Widget child;

  /// 点击事件
  final void Function()? onPressed;

  /// 倒角
  final BorderRadius borderRadius;

  /// splashColor
  final Color splashColor;

  /// highlightColor
  final Color highlightColor;

  /// backColor
  final Color backColor = Colors.transparent;

  /// width
  final double? width;

  /// height
  final double? height;

  /// 构造函数
  const DInkWellView({
    super.key,
    required this.child,
    this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.splashColor = const Color(0xffeeeeee),
    this.highlightColor = const Color(0xffeeeeee),
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              borderRadius: borderRadius,
              child: Ink(
                color: backColor,
                child: InkWell(
                  splashColor: splashColor.withAlpha(200),
                  highlightColor: Colors.transparent,
                  borderRadius: borderRadius,
                  onTap: onPressed,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
