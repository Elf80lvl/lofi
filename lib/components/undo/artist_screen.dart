import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/components/album.dart';

class ArtistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // * -BACK BUTTON-
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: kBgColor),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: kMainWhite,
                    ),
                  ),
                ),
                // * END OF -BACK BUTTON-
              ],
            ),
            Row(
              children: [
                // * -LIKE BUTTON-
                Container(
                  width: 30,
                  height: 30,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kBgColor),
                  child: Icon(
                    Icons.favorite,
                    size: 22,
                    color: kMainWhite,
                  ),
                ),
                // * END OF -LIKE BUTTON-

                SizedBox(
                  width: 16,
                ),

                // * -MORE BUTTON-
                Container(
                  width: 30,
                  height: 30,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kBgColor),
                  child: Icon(
                    Icons.more_horiz_rounded,
                    size: 30,
                    color: kMainWhite,
                  ),
                ),
                // * END OF -MORE BUTTON-
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // * -ARTIST IMAGE-
                Container(
                  child: Image.asset('assets/image/artists/fak.jpg'),
                ),
                // * END OF -ARTIST IMAGE-

                // * -GRADIENT-
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.2,
                        0.85,
                      ],
                      colors: [
                        Colors.transparent,
                        kBgColor,
                      ],
                    ),
                  ),
                ),
                // * END OF -GRADIENT-

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.7),
                    child: Column(
                      children: [
                        Text(
                          'First Aid Kit',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Chip(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          backgroundColor: kMainWhite,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset('assets/icons/playInChip.svg'),
                              // Icon(
                              //   Icons.play_arrow_rounded,
                              //   color: kBgColor,
                              // ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: kBgColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // * Top Songs Block
            Padding(
              padding: EdgeInsets.only(top: 48),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Top Songs',
                        style: TextStyle(
                            color: kMainWhite,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
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
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Albums',
                        style: TextStyle(
                            color: kMainWhite,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
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
                            imageURL: 'assets/image/albumCovers/rebelHeart.jpg',
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
                            imageURL: 'assets/image/albumCovers/lionsRoar.jpg',
                            albumName: 'The Lion\'s Roar',
                            artistName: 'Album, 2012',
                            onTap: () {},
                          ),
                          Album(
                            imageURL: 'assets/image/albumCovers/whoByFire.jpg',
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
}

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
    return ListTile(
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
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        '$artistName - $albumName',
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          print('more button pressed');
        },
        child: Icon(
          Icons.more_horiz_outlined,
          color: kSecondaryColor,
          size: 30,
        ),
      ),
    );
  }
}
