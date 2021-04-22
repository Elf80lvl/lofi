import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/components/myPopUpMenuButton.dart';
import 'package:lofi/components/my_icon_button_with_bg.dart';
import 'package:lofi/components/song_tile.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/components/album.dart';
import 'package:lofi/components/undo/popUpMenuOfSong.dart';

bool isLikedButtonPressed = false;
var title = 'First Aid Kit';

// * Проверка названия группы, если слишком длинное вызываем splitStringByLength
String checkTitleLengthAndGetTitle() {
  if (title.length > 15) {
    return splitStringByLength(title, 15);
  } else
    return title;
}

// * Разрывает строку (str) на 2 строки в точке отсчитывания количества символов (length) от начала строки, возвращает первую строку и "..."
String splitStringByLength(String str, int length) {
  List<String> data = [];
  data.add(str.substring(0, length));
  data.add(str.substring(length));
  return data[0] + '...';
}

class ArtistScreen2 extends StatefulWidget {
  @override
  _ArtistScreen2State createState() => _ArtistScreen2State();
}

class _ArtistScreen2State extends State<ArtistScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,
            backgroundColor: kBgColor,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   checkTitleLengthAndGetTitle(),
              //   maxLines: 1,
              //   overflow: TextOverflow.fade,
              //   style: TextStyle(
              //     fontWeight: FontWeight.w900,
              //   ),
              // ),
              centerTitle: true,
              background: Stack(
                children: [
                  // * ARTIST IMAGE
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/image/artists/fak.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // * GRADIENT
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    //color: Colors.white,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0,
                          0.9,
                        ],
                        colors: [
                          Colors.transparent,
                          kBgColor,
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: -190,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: kMainWhite,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // * -BACK BUTTON-
                    MyIconButtonWithBG(
                      icon: Icons.chevron_left_rounded,
                      width: 30,
                      height: 30,
                      bgColor: kBgColor,
                      iconColor: kMainWhite,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    // * END OF -BACK BUTTON-
                  ],
                ),
                Row(
                  children: [
                    // * -LIKE BUTTON-

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLikedButtonPressed == true
                              ? isLikedButtonPressed = false
                              : isLikedButtonPressed = true;
                          print('repeat button is $isLikedButtonPressed');
                        });
                      },
                      child: MyIconButtonWithBG(
                        icon: Icons.favorite,
                        width: 30,
                        height: 30,
                        bgColor: kBgColor,
                        iconColor: (isLikedButtonPressed == false)
                            ? kMainWhite
                            : kThemeColor,
                        iconSize: 18,
                      ),
                    ),
                    // * END OF -LIKE BUTTON-

                    SizedBox(
                      width: 8,
                    ),

                    // * -MORE BUTTON-
                    MyPopUpMenuButton(
                      color: kMainWhite,
                    ),
                    // * END OF -MORE BUTTON-
                  ],
                ),
              ],
            ),
          ),
          buildBody(),
        ],
      ),
    );
  }

  Widget buildBody() => SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 8,
              // ),

              // * -RADIO PLAY SHUFFLE Buttons-
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyIconTextButton(
                        text: 'Radio',
                        icon: CommunityMaterialIcons.access_point,
                        iconSize: 18,
                      ),
                      MyIconTextButton(
                        text: 'Play',
                        icon: Icons.play_arrow_rounded,
                        iconSize: 20,
                      ),
                      MyIconTextButton(
                        text: 'Shuffle',
                        icon: Icons.shuffle_rounded,
                        iconSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
              // * END OF -RADIO PLAY SHUFFLE Buttons-

              // * Top Songs Block
              Padding(
                padding: EdgeInsets.only(top: 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top Songs',
                            style: TextStyle(
                                color: kMainWhite,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyle(color: kSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SongTile(
                      imgURL: 'assets/image/albumCovers/mySilverLining.jpg',
                      songName: 'My Silver Lining',
                      artistName: 'First Aid Kit',
                      albumName: 'Stay Gold',
                    ),
                    SongTile(
                      imgURL: 'assets/image/albumCovers/rebelHeart.jpg',
                      songName: 'Fireworks',
                      artistName: 'First Aid Kit',
                      albumName: 'Ruins',
                    ),
                    SongTile(
                      imgURL: 'assets/image/albumCovers/rebelHeart.jpg',
                      songName: 'Rebel Heart',
                      artistName: 'First Aid Kit',
                      albumName: 'Ruins',
                    ),
                    SongTile(
                      imgURL: 'assets/image/albumCovers/lionsRoar.jpg',
                      songName: 'Wolf',
                      artistName: 'First Aid Kit',
                      albumName: 'The Lion\'s Roar',
                    ),
                  ],
                ),
              ),
              // * End of TOP SONGS BLOCK

              // * ALBUMS Block
              Padding(
                padding: EdgeInsets.only(top: 48),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Albums',
                            style: TextStyle(
                                color: kMainWhite,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyle(color: kSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Album(
                              imageURL:
                                  'assets/image/albumCovers/rebelHeart.jpg',
                              albumName: 'Rebel Heart',
                              artistName: 'Album, 2018',
                              onTap: () {},
                            ),
                            Album(
                              imageURL:
                                  'assets/image/albumCovers/mySilverLining.jpg',
                              albumName: 'Stay Gold',
                              artistName: 'Album, 2014',
                              onTap: () {},
                            ),
                            Album(
                              imageURL:
                                  'assets/image/albumCovers/lionsRoar.jpg',
                              albumName: 'The Lion\'s Roar',
                              artistName: 'Album, 2012',
                              onTap: () {},
                            ),
                            Album(
                              imageURL:
                                  'assets/image/albumCovers/whoByFire.jpg',
                              albumName: 'Who By Fire',
                              artistName: 'Album, 2021',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // * End of ALBUMS BLOCK

              // the very last margin
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      );
}

class MyIconTextButton extends StatelessWidget {
  const MyIconTextButton({
    Key key,
    this.text,
    this.icon,
    this.iconSize,
    this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final double iconSize;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Chip(
          backgroundColor: kBottomMenuBG,
          label: Row(
            children: [
              Icon(
                icon,
                color: kSecondaryColor,
                size: iconSize,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                text,
                style: TextStyle(
                    color: kSecondaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
