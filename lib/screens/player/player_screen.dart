import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/player/playlist_screen.dart';
import 'package:lofi/screens/player/popUpMenuOfSong.dart';
import 'package:lofi/screens/player/roundSliderTrackShape.dart';

bool isFavButtonActive = false;
bool isRepeatButtonActive = false;
var _songCurrentTime = 0.0;
var _songFullTime = 5.24;

class PlayerScreen extends StatefulWidget {
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
          GestureDetector(
            onTap: () {
              // showModalBottomSheet(
              //     isScrollControlled: true,
              //     context: context,
              //     builder: (context) {
              //       return PopUpMenuOfSong();
              //     });

              // TODO сделать иначе, чтобы PopUpMenuOfSong() появлялся возле кнопки
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
      body: Center(
        child: Padding(
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
                child: Image.asset(
                  'assets/image/albumCovers/rebelHeart.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // * Song And Artist name
              Column(
                children: [
                  Text(
                    'Rebel Heart',
                    style: TextStyle(
                        color: kMainWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'First Aid Kit',
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
                        _songFullTime.toStringAsFixed(2).replaceFirst('.', ':'),
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
                      color:
                          isRepeatButtonActive ? kThemeColor : kSecondaryColor,
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlaylistScreen()));
                },
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       Icons.expand_less_rounded,
                //       color: kMainWhite,
                //     ),
                //     Text(
                //       'Playlist',
                //       style: TextStyle(color: kMainWhite),
                //     ),
                //   ],
                // ),

                child: Chip(
                  backgroundColor: kBottomMenuBG,
                  label: Text(
                    'Playlist',
                    style: TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//'assets/image/albumCovers/rebelHeart.jpg'