import 'dart:ui';
import 'dart:io' show Platform;
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:lofi/components/myPopUpMenuButton.dart';
import 'package:lofi/components/my_icon_button_with_bg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/artist/artist_screen_v2.dart';
import 'package:lofi/screens/playlist/playlist_screen.dart';
import 'package:lofi/screens/player/roundSliderTrackShape.dart';

bool isFavButtonActive = false;
bool isRepeatButtonActive = false;
bool isShuffleButtonActive = false;
bool isDislikeButtonActive = false;
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
            MyIconButtonWithBG(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Platform.isIOS
                  ? Icons.arrow_back_ios_rounded
                  : Icons.arrow_back_rounded,
              iconColor: kMainWhite,
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
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                        color: Colors.transparent //kBgColor.withOpacity(0.5),
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
                      stops: [0.1, 0.5, 0.9],
                      colors: [kBgColor, kBgColor.withOpacity(0.7), kBgColor],
                    ),
                  ),
                ),
              ],
            ),

            // * ???????????????? ???????????????? ???????????? ?????????? ????????????????????
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // * ??????????????
                  Flexible(
                    child: GestureDetector(
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
                  ),

                  // * ????????????????, ????????????????, ???????????? ????????????????????
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),

                        // * Song And Artist name
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
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
                        ),
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
                                overlayColor: kMainWhite,
                                overlappingShapeStrokeColor: kMainWhite,
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius:
                                        18.0), // * ???????????? ???????????????? ?????????????? ???????????????????? ?????? ?????????????????????? ?????????????????? ????????????????
                                trackShape: RoundSliderTrackShape(),
                                trackHeight: 4,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 6)),
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

                      // * Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // * Repeat Button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isShuffleButtonActive == true
                                    ? isShuffleButtonActive = false
                                    : isShuffleButtonActive = true;
                                print(
                                    'repeat button is $isShuffleButtonActive');
                              });
                            },
                            child: Icon(
                              Icons.shuffle_rounded,
                              color: isShuffleButtonActive
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
                        ],
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // * Dislike Button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDislikeButtonActive == false
                                ? isDislikeButtonActive = true
                                : isDislikeButtonActive = false;
                          });
                        },
                        child: Icon(
                          (isDislikeButtonActive == true)
                              ? CommunityMaterialIcons.minus_circle
                              : CommunityMaterialIcons.minus_circle_outline,
                          color: (isDislikeButtonActive == true)
                              ? kThemeColor
                              : kSecondaryColor,
                        ),
                      ),

                      // * Playlist button
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
                ],
              ),
            ),
            // * ?????????? ???????????????? ??????????????????
          ],
        ),
      ),
    );
  }
}
