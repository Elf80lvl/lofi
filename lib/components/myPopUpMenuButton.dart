import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:lofi/components/menu_tile.dart';
import 'package:lofi/constants.dart';
import 'package:lofi/screens/artist/artist_screen_v2.dart';

class MyPopUpMenuButton extends StatelessWidget {
  const MyPopUpMenuButton({
    Key key,
    this.color,
    this.bgColor,
    this.size,
  }) : super(key: key);

  final Color color;
  final Color bgColor;
  final double size;
  //final double width, height;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (result) {
        if (result == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ArtistScreen2()));
        }
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: kBottomMenuBG,
      icon: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor != null ? bgColor : kBgColor,
        ),
        child: Icon(
          Icons.more_horiz_rounded,
          size: size != null ? size : 26,
          color: color != null ? color : kMainWhite,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: MenuTile(
            text: 'Like',
            icon: Icons.favorite,
            size: 18,
            onTap: () {
              print('like pressed');
            },
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: MenuTile(
            text: 'Add to playlist',
            icon: Icons.playlist_add,
            onTap: () {
              print('playlist pressed');
            },
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: MenuTile(
            text: 'Artist page',
            icon: CommunityMaterialIcons.account_music,
            size: 22,
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: MenuTile(
            text: 'Album page',
            icon: Icons.album,
            size: 18,
          ),
        ),
        PopupMenuItem(
          value: 5,
          child: MenuTile(
            text: 'Download',
            icon: Icons.download_rounded,
            size: 21,
          ),
        ),
        PopupMenuItem(
          value: 6,
          child: MenuTile(
            text: 'Start radio',
            icon: CommunityMaterialIcons.access_point,
            size: 21,
          ),
        ),
        PopupMenuItem(
          value: 7,
          child: MenuTile(
            text: 'Discuss',
            icon: CommunityMaterialIcons.chat,
            size: 17,
          ),
        ),
        PopupMenuItem(
          value: 8,
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
