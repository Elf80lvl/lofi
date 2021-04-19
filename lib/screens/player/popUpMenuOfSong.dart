import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:community_material_icon/community_material_icon.dart';

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
            ),
            MenuTile(
              text: 'Album page',
              icon: Icons.album,
            ),
            MenuTile(
              text: 'Download',
              icon: Icons.download_rounded,
            ),
            MenuTile(
              text: 'Start radio',
              icon: CommunityMaterialIcons.access_point,
            ),
            MenuTile(
              text: 'Discuss',
              icon: Icons.forum,
            ),
            MenuTile(
              text: 'Share',
              icon: Icons.share,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key key,
    this.onTap,
    this.text,
    this.icon,
    this.size,
  }) : super(key: key);

  final Function onTap;
  final String text;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: size,
              color: kSecondaryColor,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              text,
              style: TextStyle(
                  color: kMainWhite, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
