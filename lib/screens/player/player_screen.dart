import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/components/menu_tile.dart';
import 'package:lofi/components/myPopUpMenuButton.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/artist/artist_screen_v2.dart';
import 'package:lofi/screens/playlist/playlist_screen.dart';
import 'package:lofi/components/undo/popUpMenuOfSong.dart';
import 'package:lofi/screens/player/roundSliderTrackShape.dart';

bool isFavButtonActive = false;
bool isRepeatButtonActive = false;
var _songCurrentTime = 0.0;
var _songFullTime = 5.24;

class PlayerScreen extends StatefulWidget {
  PlayerScreen({this.imgURL, this.artistName, this.albumName, this.songName});

  final String artistName, imgURL, albumName, songName;

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: kMainWhite,
              ),
            ),
            MyPopUpMenuButton(),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            // * BG WITH BLURRED IMAGE
            Stack(
              children: [
                // * BG IMAGE
                Positioned.fill(
                  child: Image.asset(
                    widget.imgURL,
                    fit: BoxFit.cover,
                  ),
                ),

                // * BLUR AND COLOR ON IT
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Container(
                      color: kBgColor.withOpacity(0.5),
                    ),
                  ),
                ),

                // * VERTICAL GRADIENT ON BG IMAGE
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.2, 0.5, 0.8],
                      colors: [kBgColor, Colors.transparent, kBgColor],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // * обложка
                  GestureDetector(
                    onVerticalDragEnd: (DragEndDetails details) {
                      print('onVerticalDragEnd is triggered');
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kBgColor.withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(kBorderRadiusDefault),
                        child: Image.asset(
                          widget.imgURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  // * Song And Artist name
                  Column(
                    children: [
                      Text(
                        widget.songName,
                        style: TextStyle(
                            color: kMainWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.artistName,
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  // * timeline and time
                  Column(
                    children: [
                      // Container(
                      //   width: double.infinity,
                      //   height: 4,
                      //   color: Colors.white,
                      // ),
                      SliderTheme(
                        data: SliderThemeData(
                            overlayShape: RoundSliderOverlayShape(
                                overlayRadius:
                                    16.0), // * радиус фигулины которая появляется при перемещении указателя слайдера
                            trackShape: RoundSliderTrackShape(),
                            trackHeight: 4,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 6)),
                        child: Slider(
                            value: _songCurrentTime,
                            onChanged: (value) {
                              setState(() {
                                _songCurrentTime = value;
                              });
                            },
                            activeColor: kMainWhite,
                            inactiveColor: kSecondaryColor,
                            min: 0.0,
                            max: _songFullTime),
                      ),

                      // * time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _songCurrentTime
                                .toStringAsFixed(2)
                                .replaceFirst('.', ':'),
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _songFullTime
                                .toStringAsFixed(2)
                                .replaceFirst('.', ':'),
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // * Repeat Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isRepeatButtonActive == true
                                ? isRepeatButtonActive = false
                                : isRepeatButtonActive = true;
                            print('repeat button is $isRepeatButtonActive');
                          });
                        },
                        child: Icon(
                          Icons.repeat,
                          color: isRepeatButtonActive
                              ? kThemeColor
                              : kSecondaryColor,
                        ),
                      ),
                      // * Previous Song Button
                      Icon(
                        Icons.skip_previous_rounded,
                        size: 45,
                      ),

                      // * Play Button
                      GestureDetector(
                        onTap: () {
                          print('play tapped');
                        },
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          size: 60,
                          color: kMainWhite,
                        ),
                      ),

                      // * Next Song Button
                      Icon(
                        Icons.skip_next_rounded,
                        size: 45,
                      ),
                      // SvgPicture.asset(
                      //   'assets/icons/next.svg',
                      //   width: 30,
                      // ),

                      // * Like Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavButtonActive == false
                                ? isFavButtonActive = true
                                : isFavButtonActive = false;
                          });
                        },
                        child: Icon(
                          (isFavButtonActive == true)
                              ? Icons.favorite
                              : Icons.favorite_outline_rounded,
                          color: (isFavButtonActive == true)
                              ? kThemeColor
                              : kSecondaryColor,
                        ),
                      ),
                    ],
                  ),

                  // * Playlist button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconTextButton(
                        text: 'Playlist',
                        icon: CommunityMaterialIcons.playlist_music,
                        iconSize: 20,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaylistScreen(
                                        artistName: widget.artistName,
                                        albumName: widget.albumName,
                                      )));
                        },
                      ),
                    ],
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


//'assets/image/albumCovers/rebelHeart.jpg'
