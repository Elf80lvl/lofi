import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: kTextFieldInputDecorationLoginScreen.copyWith(
        hintText: 'Password',
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.lock_outline_rounded,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
