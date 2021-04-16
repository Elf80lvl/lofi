import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class ButtonWhite extends StatelessWidget {
  const ButtonWhite({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Function onTap;

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
        primary: kMainWhite,
        onPrimary: kBgColor,
        minimumSize: Size(double.infinity, 60),
      ),
    );
  }
}
