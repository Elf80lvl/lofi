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
          height: 10,
        ),
        ChatRow(
          imgURL: 'assets/image/chatAvatars/till.jpg',
          name: 'Till',
          msgPreview: 'Did you like the latest album?mmmmmmmm',
          msgCount: 4,
          time: '14:16',
        ),
        ChatRow(
          imgURL: 'assets/image/chatAvatars/matt.jpg',
          name: 'Matt Wellamy',
          msgPreview: 'I like the vibes!',
          msgCount: 11,
          time: '10:11',
        ),
      ],
    );
  }
}

class ChatRow extends StatelessWidget {
  ChatRow({this.imgURL, this.name, this.msgPreview, this.msgCount, this.time});

  final String imgURL, name, msgPreview, time;
  final int msgCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: kBottomMenuBG,
              child: CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage(imgURL),
              ),
            ),
            SizedBox(
              width: 11,
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: kMainWhite),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    msgPreview,
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
              shape: BadgeShape.square,
              toAnimate: false,
              badgeColor: kThemeColor,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              borderRadius: BorderRadius.circular(50),
              badgeContent: Text('$msgCount',
                  style: TextStyle(
                      color: kMainWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
            ),
            SizedBox(
              width: 14,
            ),
            Text(
              time,
              style: TextStyle(
                  color: kSecondaryColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}


              // Flexible(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Till',
              //         style: TextStyle(fontSize: 20, color: kMainWhite),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Text(
              //         'Did you like the latest album?mmmmmmmm',
              //         overflow: TextOverflow.ellipsis,
              //         maxLines: 1,
              //         style: TextStyle(
              //             color: kSecondaryColor,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w500),
              //       ),
              //     ],
              //   ),
              // ),