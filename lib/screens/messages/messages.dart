import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:badges/badges.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 50, left: 16),
          width: double.infinity,
          color: kBottomMenuBG,
          child: TextField(
            style: TextStyle(
              color: kMainWhite,
            ),
            decoration: kTextFieldInputDecoration.copyWith(
                hintText: 'Find people, conversation'),
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kBottomMenuBG,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundImage:
                        AssetImage('assets/image/chatAvatars/till.jpg'),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                //TODO: должен занимать все свободное пространство и двигать бэдж и время
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Till',
                        style: TextStyle(fontSize: 20, color: kMainWhite),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Did you like the latest album?mmmmmmmm',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                //Spacer(),
                Badge(
                  //shape: BadgeShape.square,
                  toAnimate: false,
                  badgeColor: kThemeColor,
                  padding: EdgeInsets.all(8),

                  borderRadius: BorderRadius.circular(50),
                  badgeContent: Text('4',
                      style: TextStyle(
                          color: kMainWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
                SizedBox(
                  width: 14,
                ),
                Text(
                  '14:16',
                  style: TextStyle(
                      color: kSecondaryColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
