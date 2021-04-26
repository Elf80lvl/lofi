import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/main_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key key,
    this.onPress,
  }) : super(key: key);

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        'Skip',
        style: TextStyle(
            color: kThemeColor, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
