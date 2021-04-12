import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class Album extends StatelessWidget {
  const Album({
    Key key,
    this.albumName,
    this.artistName,
    this.imageURL,
  }) : super(key: key);

  final String albumName, artistName, imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(height: 16),
        Text(
          albumName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
    );
  }
}
