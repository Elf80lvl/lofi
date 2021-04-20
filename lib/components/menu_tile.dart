import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key key,
    this.onTap,
    this.text,
    this.icon,
    this.size,
  }) : super(key: key);

  final Function onTap;
  final String text;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: size,
                  color: kSecondaryColor,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: TextStyle(
                  color: kMainWhite, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
