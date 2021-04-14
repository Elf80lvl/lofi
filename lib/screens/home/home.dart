import 'package:flutter/material.dart';
import 'package:lofi/screens/home/components/album.dart';
import 'package:lofi/screens/home/components/mix.dart';
import 'package:lofi/screens/home/components/top_music_tag.dart';
import 'dart:io';

class Home extends StatelessWidget {
  // const Home({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics:
                    Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
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
                physics:
                    Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
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
              SizedBox(height: 42),
              Text(
                'Mixes',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 23),
              SingleChildScrollView(
                physics:
                    Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Mix(
                      mixName: 'Synthwave',
                      cover1URL: 'assets/image/synth.jpg',
                      cover2URL: 'assets/image/synth2.jpg',
                      cover3URL: 'assets/image/synth3.jpg',
                      cover4URL: 'assets/image/synth4.jpg',
                    ),
                    Mix(
                      mixName: 'Progressive Metal',
                      cover1URL: 'assets/image/prog1.jpg',
                      cover2URL: 'assets/image/prog2.jpg',
                      cover3URL: 'assets/image/prog3.jpg',
                      cover4URL: 'assets/image/prog4.jpg',
                    ),
                    Mix(
                      mixName: 'Indie',
                      cover1URL: 'assets/image/indie1.jpg',
                      cover2URL: 'assets/image/indie2.jpg',
                      cover3URL: 'assets/image/indie3.jpg',
                      cover4URL: 'assets/image/indie4.jpg',
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
