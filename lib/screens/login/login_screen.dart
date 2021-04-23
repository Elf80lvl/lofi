import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/login/components/button_big.dart';
import 'package:lofi/screens/login/components/skip_button.dart';
import 'package:lofi/screens/main_screen.dart';
import 'package:lofi/services/auth.dart';

class LoginScreen extends StatefulWidget {
  final Function toggle;
  LoginScreen(this.toggle);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  logIn() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
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
                              text: 'Log In',
                              onTap: () {
                                logIn()();
                              },
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(color: kMainWhite),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.toggle();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: 8, left: 3, top: 16, bottom: 16),
                                    child: Text(
                                      'Create',
                                      style: TextStyle(
                                          color: kThemeColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ],
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
