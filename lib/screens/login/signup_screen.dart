import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/login/components/button_big.dart';
import 'package:lofi/screens/login/components/skip_button.dart';
import 'package:lofi/screens/login/login_screen.dart';
import 'package:lofi/screens/main_screen.dart';
import 'package:lofi/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  final Function toggle;
  SignUpScreen(this.toggle);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        print('{$value.userId}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kThemeColor),
                ),
              ),
            )
          : SafeArea(
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
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  // * Username TextField
                                  TextFormField(
                                    validator: (value) {
                                      return value.isEmpty ||
                                              value.length < 2 ||
                                              value.length > 20
                                          ? 'The username should be 3-20 characters long'
                                          : null;
                                    },
                                    controller: userNameTextEditingController,
                                    decoration:
                                        kTextFieldInputDecorationLoginScreen
                                            .copyWith(
                                      hintText: 'Username',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                          CommunityMaterialIcons.account,
                                          color: kSecondaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),

                                  // * Email TextField
                                  TextFormField(
                                    validator: (value) {
                                      return RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)
                                          ? null
                                          : "Enter correct email";
                                    },
                                    controller: emailTextEditingController,
                                    decoration:
                                        kTextFieldInputDecorationLoginScreen
                                            .copyWith(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
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

                                  // * Password TextField
                                  TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      return value.length > 5
                                          ? null
                                          : 'Password should be at least 6 characters long';
                                    },
                                    controller: passwordTextEditingController,
                                    decoration:
                                        kTextFieldInputDecorationLoginScreen
                                            .copyWith(
                                      hintText: 'Password',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Icon(
                                          Icons.lock_outline_rounded,
                                          color: kSecondaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 22,
                            ),

                            // * Sign Up button
                            ButtonBig(
                              text: 'Sign Up',
                              onTap: () {
                                signMeUp();
                              },
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
                                          // Navigator.pushAndRemoveUntil(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           LoginScreen()),
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
