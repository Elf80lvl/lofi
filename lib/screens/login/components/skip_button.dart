import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/main_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (Route<dynamic> route) => false,
        );
      },
      child: Text(
        'Skip',
        style: TextStyle(
            color: kThemeColor, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
