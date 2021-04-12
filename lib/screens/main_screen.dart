import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/account/account.dart';
import 'package:lofi/screens/home/home.dart';
import 'package:lofi/screens/library/library.dart';
import 'package:lofi/screens/messages/messages.dart';
import 'package:lofi/screens/search/search.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = [
    Home(),
    Library(),
    Account(),
    Messages(),
    Search(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //TODO чтобы не было ошибки overflow при появлении клавиатуры на экране Library, надо найти решение лучше
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kBgColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
            ),
            activeIcon: SvgPicture.asset('assets/icons/HomeActive.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/library.svg'),
            activeIcon: SvgPicture.asset('assets/icons/libraryActive.svg'),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/account.svg'),
            activeIcon: SvgPicture.asset('assets/icons/accountActive.svg'),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              badgeContent: Text(
                '24',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              badgeColor: kThemeColor,
              child: SvgPicture.asset('assets/icons/messages.svg'),
            ),
            activeIcon: Badge(
              badgeContent: Text(
                '24',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              badgeColor: kThemeColor,
              child: SvgPicture.asset('assets/icons/messagesActive.svg'),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Search.svg'),
              activeIcon: SvgPicture.asset('assets/icons/SearchActive.svg'),
              label: 'Search'),
        ],
      ),
      backgroundColor: Color(0xff1D2027),
      body: _widgetOptions.elementAt(_currentIndex),
    );
  }
}
