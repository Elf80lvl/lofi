import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lofi/components/myPopUpMenuButton.dart';
import 'package:lofi/components/my_icon_button_with_bg.dart';
import 'package:lofi/components/song_tile.dart';
import 'package:lofi/constants.dart';
import '../player/songData.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({this.artistName, this.albumName});

  final String artistName, albumName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyIconButtonWithBG(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.chevron_left_rounded,
              iconColor: kMainWhite,
            ),

            Text(
              albumName,
              style: TextStyle(
                fontSize: 16,
                color: kMainWhite,
                fontWeight: FontWeight.w500,
                //decoration: TextDecoration.underline,
              ),
            ),
            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: albumName,
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: kMainWhite,
            //           fontWeight: FontWeight.w500,
            //           //decoration: TextDecoration.underline,
            //         ),
            //       ),
            //       TextSpan(text: ' '),
            //       TextSpan(
            //         text: 'by ',
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: kSecondaryColor,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       TextSpan(
            //         text: artistName,
            //         style: TextStyle(
            //           fontSize: 16,
            //           color: kMainWhite,
            //           fontWeight: FontWeight.w500,
            //           //decoration: TextDecoration.underline,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            MyPopUpMenuButton(),
          ],
        ),
      ),
      body: ListView.builder(
        physics: Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
        itemCount: songData.length,
        itemBuilder: (_, index) => SongTile(
          songName: songData[index].songName,
          imgURL: songData[index].imgURL,
          artistName: songData[index].artistName,
          albumName: songData[index].albumName,
        ),
      ),
    );
  }
}

// class SongName extends StatelessWidget {
//   const SongName({
//     Key key,
//     this.songNumber,
//     this.songName,
//     this.isPlaying,
//   }) : super(key: key);

//   final int songNumber;
//   final String songName;
//   final bool isPlaying;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 14),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 (isPlaying == true)
//                     ? Container(
//                         width: 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: kThemeColor,
//                         ),
//                       )
//                     : SizedBox(
//                         width: 8,
//                         height: 8,
//                       ),
//                 SizedBox(
//                   width: 0,
//                 ),
//                 Container(
//                   width: 22,
//                   child: Text(
//                     songNumber.toString(),
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: kSecondaryColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 // * SONGNAME
//                 Flexible(
//                   child: Text(
//                     songName,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: kMainWhite,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Icon(
//             Icons.more_horiz,
//             color: kSecondaryColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
