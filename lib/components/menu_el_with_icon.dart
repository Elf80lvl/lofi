import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

class MenuElementWithIcon extends StatelessWidget {
  MenuElementWithIcon({this.iconURL, this.name, this.number, this.onTap});

  final String iconURL, name;
  final int number;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(iconURL),
            SizedBox(width: 13),
            Text(
              name,
              style: TextStyle(color: kMainWhite, fontSize: 18),
            ),
            Spacer(),
            Text(
              number.toString(),
              style: TextStyle(color: kSecondaryColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
