import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

class MenuElementAccount extends StatelessWidget {
  MenuElementAccount({this.iconURL, this.name, this.onTap});

  final String iconURL, name;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 42),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(iconURL),
            SizedBox(width: 13),
            Text(
              name,
              style: TextStyle(color: kMainWhite, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
