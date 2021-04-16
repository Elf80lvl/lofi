import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.vertical,
      key: const Key('key'),
      onDismissed: (_) => Navigator.of(context).pop(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.expand_more_rounded,
              size: 30,
              color: kMainWhite,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.more_horiz,
                size: 30,
                color: kMainWhite,
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // * обложка
                Image.asset(
                  'assets/image/albumCovers/rebelHeart.jpg',
                  fit: BoxFit.cover,
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
                    Container(
                      width: double.infinity,
                      height: 4,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '00:00',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '5:24',
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
                    Icon(
                      Icons.repeat,
                      color: kSecondaryColor,
                    ),
                    Icon(
                      Icons.skip_previous_rounded,
                      size: 45,
                    ),
                    // SvgPicture.asset(
                    //   'assets/icons/prev.svg',
                    //   width: 30,
                    // ),
                    GestureDetector(
                      onTap: () {
                        print('play tapped');
                      },
                      child: Icon(
                        Icons.play_circle_fill_rounded,
                        size: 60,
                        color: kMainWhite,
                      ),
                      // child: SvgPicture.asset(
                      //   'assets/icons/play.svg',
                      //   width: 35,
                      // ),
                    ),
                    Icon(
                      Icons.skip_next_rounded,
                      size: 45,
                    ),
                    // SvgPicture.asset(
                    //   'assets/icons/next.svg',
                    //   width: 30,
                    // ),
                    Icon(
                      Icons.favorite_outline_rounded,
                      color: kSecondaryColor,
                    ),
                  ],
                ),

                // Badge(
                //   toAnimate: false,
                //   shape: BadgeShape.square,
                //   borderRadius: BorderRadius.circular(50),
                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                //   badgeContent: Text(
                //     'Playlist',
                //     textAlign: TextAlign.center,
                //     style:
                //         TextStyle(fontWeight: FontWeight.bold, color: kBgColor),
                //   ),
                //   badgeColor: kMainWhite,
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.expand_less_rounded,
                      color: kMainWhite,
                    ),
                    Text(
                      'Playlist',
                      style: TextStyle(color: kMainWhite),
                    ),
                  ],
                ),

                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//'assets/image/albumCovers/rebelHeart.jpg'