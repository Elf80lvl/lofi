import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/home/home.dart';
import 'package:lofi/screens/library/library.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = [
    Home(),
    Library(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Home.svg'),
              label: 'Home',
              backgroundColor: kBgColor),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/library.svg'),
              label: 'Library',
              backgroundColor: kBgColor),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/account.svg'),
              label: 'Account',
              backgroundColor: kBgColor),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/messages.svg'),
              label: 'Messages',
              backgroundColor: kBgColor),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Search.svg'),
              label: 'Search'),
        ],
      ),
      backgroundColor: Color(0xff1D2027),
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }
}
