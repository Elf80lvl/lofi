import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
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
        backgroundColor: kBgColor,
        bottomAppBarColor: kBgColor,
        scaffoldBackgroundColor: kBgColor,
      ),
      home: MainScreen(),
    );
  }
}
