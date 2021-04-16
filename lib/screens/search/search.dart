import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/search/components/song_searched.dart';
import 'package:lofi/screens/search/components/tag.dart';
import 'package:lofi/screens/search/components/whats_playing_button.dart';

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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Recent searches',
                        style: TextStyle(
                          color: kMainWhite,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SongSearched(
                        imgURL: 'assets/image/woodkid.jpg',
                        title: 'Iron',
                        subtitle: 'Woodkid',
                      ),
                      SongSearched(
                        imgURL: 'assets/image/medicine.jpg',
                        title: 'Medicine',
                        subtitle: 'Daughter',
                      ),
                    ],
                  ),
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
