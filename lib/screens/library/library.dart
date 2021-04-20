import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/components/menu_el_with_icon.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
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
                    hintText: 'Find in library'),
                onChanged: (value) {},
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              MenuElementWithIcon(
                iconURL: 'assets/icons/downloaded.svg',
                name: 'Downloaded',
                number: 23,
                onTap: () {},
              ),
              MenuElementWithIcon(
                iconURL: 'assets/icons/likedSongs.svg',
                name: 'Liked songs',
                number: 156,
                onTap: () {},
              ),
              MenuElementWithIcon(
                iconURL: 'assets/icons/playlists.svg',
                name: 'Playlists',
                number: 12,
                onTap: () {},
              ),
              MenuElementWithIcon(
                iconURL: 'assets/icons/albums.svg',
                name: 'Albums',
                number: 22,
                onTap: () {},
              ),
              MenuElementWithIcon(
                iconURL: 'assets/icons/artists.svg',
                name: 'Artists',
                number: 22,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
