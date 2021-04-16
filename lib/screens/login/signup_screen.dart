import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/login/components/button_white.dart';
import 'package:lofi/screens/login/components/skip_button.dart';
import 'package:lofi/screens/login/components/textField_email.dart';
import 'package:lofi/screens/login/components/textField_password.dart';
import 'package:lofi/screens/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // * logo
                SvgPicture.asset('assets/icons/logo.svg'),
                SizedBox(
                  height: 48,
                ),
                // * main
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TextFieldEmail(),
                      SizedBox(
                        height: 22,
                      ),
                      TextFieldPassword(),
                      SizedBox(
                        height: 22,
                      ),
                      // * Sign Up button
                      ButtonWhite(
                        text: 'Sign Up',
                        onTap: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Already have an account? '),
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                    color: kThemeColor,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                ),

                SkipButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
