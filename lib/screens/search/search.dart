import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lofi/components/song_tile.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/components/tag.dart';
import 'package:lofi/components/whats_playing_button.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // * блок с поиском
            padding: EdgeInsets.only(left: 16, right: 16),
            height: 60,
            width: double.infinity,
            color: kBottomMenuBG,
            child: Center(
              child: TextField(
                style: TextStyle(
                  color: kMainWhite,
                ),
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Find artist, album, song'),
                onChanged: (value) {},
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics:
                  Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
              children: [
                // * 'what's playing' button
                WhatsPlayingButton(),
                // * Recent searches block
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Recent searches',
                        style: TextStyle(
                          color: kMainWhite,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SongTile(
                      imgURL: 'assets/image/woodkid.jpg',
                      songName: 'Iron',
                      artistName: 'Woodkid',
                    ),
                    SongTile(
                      imgURL: 'assets/image/medicine.jpg',
                      songName: 'Medicine',
                      artistName: 'Daughter',
                    ),
                    SongTile(
                      imgURL: 'assets/image/albumCovers/rebelHeart.jpg',
                      songName: 'Fireworks',
                      artistName: 'First Aid Kit',
                      albumName: 'Ruins',
                    ),
                  ],
                ),
                // * Tags
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Tag(text: 'Blues', onTap: () {}),
                      Tag(text: 'Business', onTap: () {}),
                      Tag(text: 'Brazilian', onTap: () {}),
                      Tag(text: 'Chill', onTap: () {}),
                      Tag(text: 'Classical', onTap: () {}),
                      Tag(text: 'Country', onTap: () {}),
                      Tag(text: 'EDM', onTap: () {}),
                      Tag(text: 'Education', onTap: () {}),
                      Tag(text: 'Electronic', onTap: () {}),
                      Tag(text: 'Folk', onTap: () {}),
                      Tag(text: 'Gaming', onTap: () {}),
                      Tag(text: 'Indie', onTap: () {}),
                      Tag(text: 'Jazz', onTap: () {}),
                      Tag(text: 'K-pop', onTap: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
