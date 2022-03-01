import 'package:flutter/material.dart';
import 'package:flutter_project/widget/list_item.dart';

class CircularIcon extends StatelessWidget {
  /// 颜色
  final Color color;

  /// 背景颜色
  final Color? bgColor;

  /// Icon
  final IconData? icon;

  const CircularIcon({
    Key? key,
    this.color = Colors.white,
    this.bgColor = Colors.orange,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: icon == null
            ? EmptyIcon()
            : Icon(
                icon,
                size: 20.0,
                color: color,
              ),
      ),
    );
  }
}
