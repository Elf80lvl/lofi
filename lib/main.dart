import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/home_screen.dart';

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
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
