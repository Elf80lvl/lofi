import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class ButtonBig extends StatelessWidget {
  ButtonBig({this.text, this.onTap, this.color, this.bgColor});

  final String text;
  final Function onTap;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: color != null ? color : kThemeColor,
        onPrimary: bgColor != null ? kBgColor : kMainWhite,
        minimumSize: Size(double.infinity, 60),
      ),
    );
  }
}
