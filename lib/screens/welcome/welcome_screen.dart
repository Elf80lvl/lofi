import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/main_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SvgPicture.asset('assets/icons/logo.svg'),
            ),
            //Spacer(),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Listen',
                    style: TextStyle(
                        color: kMainWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Text(
                        'Listen to music while Lofi learns with every tap',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kMainWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: kThemeColor),
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
