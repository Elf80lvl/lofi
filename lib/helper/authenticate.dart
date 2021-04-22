import 'package:flutter/material.dart';
import 'package:lofi/screens/login/login_screen.dart';
import 'package:lofi/screens/login/signup_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleView);
    } else {
      return SignUpScreen(toggleView);
    }
  }
}
