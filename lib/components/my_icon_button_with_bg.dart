import 'package:flutter/material.dart';

// * круглая иконка с кастомными цветами и размерами фона и иконки.
class MyIconButtonWithBG extends StatelessWidget {
  MyIconButtonWithBG(
      {this.width,
      this.height,
      this.iconSize,
      @required this.icon,
      this.bgColor,
      this.iconColor,
      this.onTap});

  final double width, height, iconSize;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width != null ? width : 32,
        height: height != null ? height : 32,
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
