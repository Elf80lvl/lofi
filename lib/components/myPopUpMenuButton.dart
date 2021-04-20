import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:lofi/components/menu_tile.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/artist/artist_screen_v2.dart';

class MyPopUpMenuButton extends StatelessWidget {
  const MyPopUpMenuButton({
    Key key,
    this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: kBottomMenuBG,
      icon: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBgColor,
        ),
        child: Icon(
          Icons.more_horiz_rounded,
          color: color,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: MenuTile(
            text: 'Like',
            icon: Icons.favorite,
            size: 16,
            onTap: () {
              print('like pressed');
            },
          ),
        ),
        PopupMenuItem(
          child: MenuTile(
            text: 'Add to playlist',
            icon: Icons.playlist_add,
            onTap: () {
              print('playlist pressed');
            },
          ),
        ),
        PopupMenuItem(
          child: MenuTile(
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
        ),
        PopupMenuItem(
          child: MenuTile(
            text: 'Album page',
            icon: Icons.album,
            size: 18,
          ),
        ),
        PopupMenuItem(
          child: MenuTile(
            text: 'Download',
            icon: Icons.download_rounded,
            size: 21,
          ),
        ),
        PopupMenuItem(
          child: MenuTile(
            text: 'Start radio',
            icon: CommunityMaterialIcons.access_point,
            size: 21,
          ),
        ),
        PopupMenuItem(
          child: MenuTile(
            text: 'Discuss',
            icon: CommunityMaterialIcons.chat,
            size: 17,
          ),
        ),
        PopupMenuItem(
          child: MenuTile(
            text: 'Share',
            icon: Icons.share,
            size: 18,
          ),
        ),
      ],
    );
  }
}
