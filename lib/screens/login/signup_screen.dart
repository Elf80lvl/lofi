import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/login/login_screen.dart';
import 'package:lofi/screens/main_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      TextField(
                        decoration:
                            kTextFieldInputDecorationLoginScreen.copyWith(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.email_outlined,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        decoration:
                            kTextFieldInputDecorationLoginScreen.copyWith(
                          hintText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.lock_outline_rounded,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      // * Sign Up button
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          primary: kMainWhite,
                          onPrimary: kBgColor,
                          minimumSize: Size(double.infinity, 60),
                        ),
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
                // * Skip Button
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: kThemeColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
