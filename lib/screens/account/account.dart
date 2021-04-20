import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/components/menu_el.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
