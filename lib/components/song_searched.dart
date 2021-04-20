import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

class SongSearched extends StatelessWidget {
  SongSearched({this.imgURL, this.title, this.subtitle});

  final String imgURL, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          print('song was tapped');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              //картинка и надписи
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(kBorderRadiusDefault / 2),
                    child: Image.asset(
                      imgURL,
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: kMainWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: kSecondaryColor,
                ),
                onPressed: () {
                  print('more button was tapped');
                }),
          ],
        ),
      ),
    );
  }
}
