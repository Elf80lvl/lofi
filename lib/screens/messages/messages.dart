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
        Expanded(
          child: ListView(
            children: [
              ChatRow(
                imgURL: 'assets/image/chatAvatars/till.jpg',
                name: 'Till',
                msgPreview: 'Did you like the latest album?mmmmmmmm',
                msgCount: 4,
                time: '14:16',
                //isOnline: true,
              ),
              ChatRow(
                imgURL: 'assets/image/chatAvatars/matt.jpg',
                name: 'Matt Wellamy',
                msgPreview: 'I like the vibes!',
                msgCount: 11,
                time: '10:11',
              ),
              ChatRow(
                imgURL: 'assets/image/chatAvatars/lana.jpg',
                name: 'Lana Del Ring',
                msgPreview: 'Summertime finally!',
                msgCount: 9,
                time: '9:23',
                isOnline: true,
              ),
              ChatRow(
                imgURL: 'assets/image/chatAvatars/tom.jpg',
                name: 'Tom Angeles',
                msgPreview: 'This gonna be a hit',
                //msgCount: 9,
                time: '7:00',
                isOnline: true,
              ),
              ChatRow(
                imgURL: 'assets/image/chatAvatars/tobias.jpg',
                name: 'Tobias Mold',
                msgPreview: 'Trying my best!',
                //msgCount: 9,
                time: '6:55',
              ),
              ChatRow(
                name: 'Tilo Fox',
                imgURL: 'assets/image/chatAvatars/tilo.jpg',
                msgPreview: 'In the dark',
                //msgCount: 9,
                time: '6:55',
              ),
              ChatRow(
                name: 'Elena Tonro',
                imgURL: 'assets/image/chatAvatars/elena.jpg',
                msgPreview: 'Doing the right thing',
                //msgCount: 9,
                time: '6:55',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatRow extends StatelessWidget {
  ChatRow(
      {this.imgURL,
      this.name,
      this.msgPreview,
      this.msgCount,
      this.time,
      this.isOnline});

  final String imgURL, name, msgPreview, time;
  final int msgCount;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('chat row tapped');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: kBottomMenuBG,
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage: (imgURL != null)
                                ? AssetImage(imgURL)
                                : AssetImage('assets/image/noAva.jpg'),
                          ),
                        ),
                        Positioned(
                          //Online indicator
                          right: 3,
                          top: 4,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (isOnline == true)
                                  ? Color(0xFF5DD27E)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Flexible(
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
                  ],
                ),
              ),
              Row(
                children: [
                  Badge(
                    showBadge: (msgCount != null) ? true : false,
                    elevation: 0,
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
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 40),
                    child: Text(
                      time,
                      style: TextStyle(
                          color: kSecondaryColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
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