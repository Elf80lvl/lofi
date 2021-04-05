import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/components/top_music_tag.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        height: 84,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/Home.svg'),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/library.svg'),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/account.svg'),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/messages.svg'),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/icons/Search.svg'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff1D2027),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TopMusicTag(text: '#Pop', press: () {}),
                    TopMusicTag(text: '#Progressive', press: () {}),
                    TopMusicTag(text: '#Indie', press: () {}),
                    TopMusicTag(text: '#Metal', press: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 42,
              ),
              Text(
                'Recently Played',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 23),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Album(
                      albumName: 'Ruins',
                      artistName: 'First Aid Kit',
                      imageURL: 'assets/image/fak.jpg',
                    ),
                    Album(
                      albumName: 'Toi Toi',
                      artistName: 'Suzane',
                      imageURL: 'assets/image/suzane.jpg',
                    ),
                    Album(
                      albumName: 'Mirele',
                      artistName: 'Mirele',
                      imageURL: 'assets/image/mirele.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            borderRadius: BorderRadius.circular(10.0),
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
