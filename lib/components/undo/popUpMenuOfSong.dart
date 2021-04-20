import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/components/menu_tile.dart';
import 'package:lofi/constants.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:lofi/screens/artist/artist_screen.dart';
import 'package:lofi/screens/artist/artist_screen_v2.dart';

class PopUpMenuOfSong extends StatelessWidget {
  const PopUpMenuOfSong({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width - 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: kBottomMenuBG,
      ),
      //height: MediaQuery.of(context).size.height * 0.75,

      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 32, vertical: 32.0 - 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuTile(
              text: 'Like',
              icon: Icons.favorite,
              size: 16,
              onTap: () {
                print('like pressed');
              },
            ),
            MenuTile(
              text: 'Add to playlist',
              icon: Icons.playlist_add,
              onTap: () {
                print('playlist pressed');
              },
            ),
            MenuTile(
              text: 'Artist page',
              icon: CommunityMaterialIcons.account_music,
              size: 22,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ArtistScreen2();
                }));
              },
            ),
            MenuTile(
              text: 'Album page',
              icon: Icons.album,
              size: 18,
            ),
            MenuTile(
              text: 'Download',
              icon: Icons.download_rounded,
              size: 21,
            ),
            MenuTile(
              text: 'Start radio',
              icon: CommunityMaterialIcons.access_point,
              size: 21,
            ),
            MenuTile(
              text: 'Discuss',
              icon: CommunityMaterialIcons.chat,
              size: 17,
            ),
            MenuTile(
              text: 'Share',
              icon: Icons.share,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
