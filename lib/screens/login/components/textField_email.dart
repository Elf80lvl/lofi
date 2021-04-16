import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: kTextFieldInputDecorationLoginScreen.copyWith(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.email_outlined,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
