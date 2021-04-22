import 'package:flutter/material.dart';
import 'package:lofi/components/myPopUpMenuButton.dart';
import 'package:lofi/constants.dart';

class Album extends StatelessWidget {
  const Album({
    Key key,
    this.albumName,
    this.artistName,
    this.imageURL,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final String albumName, artistName, imageURL;
  final Function onTap;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadiusDefault),
                  child: Image.asset(
                    imageURL,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  right: 16,
                  child: MyPopUpMenuButton(
                    bgColor: kBgColor.withOpacity(0.5),
                    //color: kBgColor,
                  )),
              // Positioned(
              //   right: 67,
              //   top: 55,
              //   child: Icon(
              //     Icons.play_circle_fill_rounded,
              //     color: kMainWhite,
              //     size: 40,
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            albumName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Text(
            artistName,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kSecondaryColor),
          ),
        ],
      ),
    );
  }
}
