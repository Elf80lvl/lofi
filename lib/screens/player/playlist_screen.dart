import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/player/popUpMenuOfSong.dart';
import 'songData.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Ruins',
                style: TextStyle(
                  fontSize: 18,
                  color: kMainWhite,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(text: ' '),
              TextSpan(
                text: 'by ',
                style: TextStyle(
                  fontSize: 18,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'First Aid Kit',
                style: TextStyle(
                  fontSize: 18,
                  color: kMainWhite,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),

        // * back button
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: kMainWhite,
          ),
        ),
        actions: [
          // * more button
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext cxt) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: PopUpMenuOfSong(),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.more_horiz,
                size: 30,
                color: kMainWhite,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 16, top: 16, bottom: 16, left: 22),
        child: ListView.builder(
          physics: Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
          itemCount: songData.length,
          itemBuilder: (_, index) => SongName(
            songNumber: songData[index].songNumber,
            songName: songData[index].songName,
            isPlaying: songData[index].isPlaying,
          ),
        ),
      ),
    );
  }
}

class SongName extends StatelessWidget {
  const SongName({
    Key key,
    this.songNumber,
    this.songName,
    this.isPlaying,
  }) : super(key: key);

  final int songNumber;
  final String songName;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                (isPlaying == true)
                    ? Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kThemeColor,
                        ),
                      )
                    : SizedBox(
                        width: 8,
                        height: 8,
                      ),
                SizedBox(
                  width: 0,
                ),
                Container(
                  width: 22,
                  child: Text(
                    songNumber.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      color: kSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // * SONGNAME
                Flexible(
                  child: Text(
                    songName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: kMainWhite,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_horiz,
            size: 30,
            color: kSecondaryColor,
          ),
        ],
      ),
    );
  }
}
