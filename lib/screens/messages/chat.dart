import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lofi/constants.dart';

class Chat extends StatelessWidget {
  Chat({this.name, this.avatarURL, this.isOnline});

  final String name, avatarURL;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 60,
              width: double.infinity,
              color: kBottomMenuBG,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset('assets/icons/back.svg')),
                  Container(
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  color: kMainWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              isOnline ? 'online' : 'offline',
                              style: TextStyle(
                                  color: (isOnline == true)
                                      ? Color(0xFF5DD27E)
                                      : kSecondaryColor,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('avatar pressed');
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: kBottomMenuBG,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(avatarURL),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    MessageRight(
                      message: 'Prequell is a blast',
                      time: '6:50',
                    ),
                    MessageRight(
                      message: 'Keep up the good work!',
                      time: '6:50',
                    ),
                    MessageLeft(
                      message: 'Thank you!',
                      time: '6:55',
                    ),
                    MessageLeft(
                      message: 'Trying my best!',
                      time: '6:55',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 0, right: 0),
              height: 60,
              width: double.infinity,
              color: kBottomMenuBG,
              child: Center(
                child: TextField(
                  style: TextStyle(
                    color: kMainWhite,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        print('prefix icon pressed');
                      },
                      icon: Icon(
                        Icons.attach_file,
                        color: kSecondaryColor,
                      ),
                    ),
                    suffixStyle: TextStyle(color: Colors.white),
                    hintText: 'Message',
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      //splashRadius: 0.0,
                      onPressed: () {
                        print('suffix icon pressed');
                      },
                      icon: Icon(
                        Icons.send,
                        color: kSecondaryColor,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: kSecondaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageRight extends StatelessWidget {
  const MessageRight({
    Key key,
    this.message,
    this.time,
  }) : super(key: key);
  final String message, time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: kMainWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: kBgColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '6:50',
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 16,
                ),
                SvgPicture.asset('assets/icons/msgChecked.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageLeft extends StatelessWidget {
  const MessageLeft({
    Key key,
    this.message,
    this.time,
  }) : super(key: key);
  final String message, time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: kBottomMenuBG,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: kMainWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '6:50',
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}