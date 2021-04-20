import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/artist/artist_screen_v2.dart';
import 'package:lofi/screens/login/login_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LoFi',
      //darkTheme: ThemeData.dark(),
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.transparent,
        backgroundColor: kBgColor,
        bottomAppBarColor: kBgColor,
        scaffoldBackgroundColor: kBgColor,
      ),
      home: LoginScreen(),
    );
  }
}
