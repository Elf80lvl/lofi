import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/login/components/button_big.dart';
import 'package:lofi/screens/login/components/skip_button.dart';
import 'package:lofi/screens/login/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function toggle;
  LoginScreen(this.toggle);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        controller: emailTextEditingController,
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
                        controller: passwordTextEditingController,
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
                        height: 8,
                      ),

                      // * Forgot PasswordButton
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: kThemeColor),
                      ),
                      SizedBox(
                        height: 22,
                      ),

                      // * Log in button
                      ButtonBig(
                        text: 'Log In',
                        onTap: () {},
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'Don\'t have an account? '),
                              TextSpan(
                                text: 'Create',
                                style: TextStyle(
                                    color: kThemeColor,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.pushAndRemoveUntil(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => SignUpScreen()),
                                    //   (Route<dynamic> route) => false,
                                    // );
                                    widget.toggle();
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
