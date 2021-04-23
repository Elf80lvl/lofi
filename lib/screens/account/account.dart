import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/components/menu_el.dart';
import 'package:lofi/helper/authenticate.dart';
import 'package:lofi/services/auth.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              width: double.infinity,
              color: kBottomMenuBG,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/image/ava.jpg'),
                    radius: 35,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Cathlyn Smith',
                    style: TextStyle(color: kMainWhite, fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'cathlynsmith@gmail.com',
                    style: TextStyle(fontSize: 12, color: kSecondaryColor),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See stats',
                        style: TextStyle(color: kThemeColor, fontSize: 12),
                      )),
                ],
              ),
            ),
            //элементы меню
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  MenuElementAccount(
                    iconURL: 'assets/icons/manageAccount.svg',
                    name: 'Manage Account',
                    onTap: () {},
                  ),
                  MenuElementAccount(
                    iconURL: 'assets/icons/audioSettings.svg',
                    name: 'Audio Settings',
                    onTap: () {},
                  ),
                  MenuElementAccount(
                    iconURL: 'assets/icons/appSettings.svg',
                    name: 'App Settings',
                    onTap: () {},
                  ),
                  MenuElementAccount(
                    iconURL: 'assets/icons/connectedDevices.svg',
                    name: 'Connected Devices',
                    onTap: () {},
                  ),
                  MenuElementAccount(
                    iconURL: 'assets/icons/helpAndFeedback.svg',
                    name: 'Help And Feedback',
                    onTap: () {},
                  ),

                  //TODO: change icon
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GestureDetector(
                      onTap: () {
                        print('SIGN OUT tapped');
                        authMethods.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Authenticate()));
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
