import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/search/components/song_searched.dart';
import 'package:lofi/screens/search/components/tag.dart';

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
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  // * 'what's playing' button
                  onTap: () {
                    print('whats playing was tapped');
                  },
                  child: Chip(
                    avatar: SvgPicture.asset('assets/icons/whatsPlaying.svg'),
                    backgroundColor: kMainWhite,
                    padding: EdgeInsets.all(12),
                    label: Text(
                      'What\'s playing?',
                      style: TextStyle(
                          color: kBgColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(
                  height: 58,
                ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Tag('Blues'),
                      Tag('Business'),
                      Tag('Brazilian'),
                      Tag('Chill'),
                      Tag('Classical'),
                      Tag('Country'),
                      Tag('EDM'),
                      Tag('Education'),
                      Tag('Electronic'),
                      Tag('Folk'),
                      Tag('Gaming'),
                      Tag('Indie'),
                      Tag('Jazz'),
                      Tag('K-pop'),
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
