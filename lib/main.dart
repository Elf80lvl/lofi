import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/helper/authenticate.dart';

// TODO: connect the firebase to ios if needed: https://youtu.be/FTju8w4zEno?t=2911
// TODO: use a real android device for testing since AVD seems to be bugged when working with firebase
// at the moment it is connected to android only

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        //primaryColor: kBgColor,
        accentColor: Colors.transparent,
        backgroundColor: kBgColor,
        bottomAppBarColor: kBgColor,
        scaffoldBackgroundColor: kBgColor,
      ),
      home: Authenticate(),
    );
  }
}
