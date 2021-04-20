import 'package:flutter/material.dart';
import 'package:lofi/components/MyPopUpMenuButton.dart';
import 'package:lofi/constants.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    Key key,
    this.onTap,
    this.songName,
    this.artistName,
    this.albumName,
    this.imgURL,
  }) : super(key: key);

  final Function onTap;
  final String imgURL, songName, artistName, albumName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadiusDefault / 2),
            child: Image.asset(
              imgURL,
              height: 48,
              width: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          songName,
          style: TextStyle(
            color: kMainWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: (albumName == null)
            ? Text(
                '$artistName',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            : Text(
                '$artistName - $albumName',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
        trailing: GestureDetector(
          onTap: () {
            print('more button pressed');
          },
          child: MyPopUpMenuButton(
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
