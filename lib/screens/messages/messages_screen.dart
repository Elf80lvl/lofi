import 'dart:io' show Platform; //для определения ОС устройства (Platform.isIos)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';
import 'package:badges/badges.dart';
import 'package:lofi/screens/messages/chat.dart';
import 'package:lofi/screens/messages/msgData.dart';
import 'package:lofi/services/database.dart';
import 'msgData.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  TextEditingController messagesScreenTextEditingController =
      TextEditingController();
  DatabaseMethods databaseMethods = DatabaseMethods();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethods
        .getUserByUsername(messagesScreenTextEditingController.text)
        .then((val) {
      setState(() {
        print(val.toString());
        searchSnapshot = val;
      });
    });
  }

  Widget searchList() {
    print('object');
    return searchSnapshot != null
        ? ListView.builder(
            itemCount: searchSnapshot.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // return Container(
              //   child: Text(searchSnapshot.docs[index].data()['name']),
              // );
              return ChatRow(
                name: searchSnapshot.docs[index].data()['name'],
                isOnline: false,
                imgURL: 'assets/image/chatAvatars',
                msgPreview: '',
                msgCount: 0,
                time: 'N/A',
              );
            })
        : Container();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            height: 60,
            width: double.infinity,
            color: kBottomMenuBG,
            child: Center(
              // * Поиск юзера
              child: TextField(
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                controller: messagesScreenTextEditingController,
                style: TextStyle(
                  color: kMainWhite,
                ),
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Find people, conversation'),
                onChanged: (value) {
                  initiateSearch();
                },
              ),
            ),
          ),
          Expanded(
            child: searchList(),
            // * data - массив с данными списка чата из msgData.dart
            // child: ListView.builder(
            //   physics:
            //       Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
            //   itemCount: data.length,
            //   itemBuilder: (_, index) => InkWell(
            //     onTap: () {
            //       print('${data[index].name} was tapped');
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) {
            //           return Chat(
            //               name: data[index].name,
            //               avatarURL: data[index].imgURL,
            //               isOnline: data[index].isOnline);
            //         }),
            //       );
            //     },
            //     child: ChatRow(
            //       imgURL: data[index].imgURL,
            //       name: data[index].name,
            //       msgPreview: data[index].msgPreview,
            //       msgCount: data[index].msgCount,
            //       time: data[index].time,
            //       isOnline: data[index].isOnline,

            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

// * Строка юзера чата с картинкой, именем, превью сообщения, количеством непрочитанных сообщений, временем и сосятояние онлайн
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
    return Padding(
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
                        // * Online indicator
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
                          style: TextStyle(
                              fontSize: 18,
                              color: kMainWhite,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
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
                  width: 6,
                ),
                ConstrainedBox(
                  //контейнер с минимальной шириной 50, чтобы влезло не только время но и дата формата "12 Jun" если последнее сообщение было получено не сегодня. Текст к правой границе.
                  constraints: BoxConstraints(minWidth: 50),
                  child: Text(
                    time,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: kSecondaryColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// Expanded(
//           child: ListView(
//             physics: Platform.isIOS ? BouncingScrollPhysics() : ScrollPhysics(),
//             children: [
//               ChatRow(
//                 imgURL: 'assets/image/chatAvatars/till.jpg',
//                 name: 'Till',
//                 msgPreview: 'Did you like the latest album?mmmmmmmm',
//                 msgCount: 4,
//                 time: '14:16',
//                 //isOnline: true,
//               ),
//               ChatRow(
//                 imgURL: 'assets/image/chatAvatars/matt.jpg',
//                 name: 'Matt Wellamy',
//                 msgPreview: 'I like the vibes!',
//                 msgCount: 11,
//                 time: '10:11',
//               ),
//               ChatRow(
//                 imgURL: 'assets/image/chatAvatars/lana.jpg',
//                 name: 'Lana Del Ring',
//                 msgPreview: 'Summertime finally!',
//                 msgCount: 9,
//                 time: '9:23',
//                 isOnline: true,
//               ),
//               ChatRow(
//                 imgURL: 'assets/image/chatAvatars/tom.jpg',
//                 name: 'Tom Angeles',
//                 msgPreview: 'This gonna be a hit',
//                 //msgCount: 9,
//                 time: '7:00',
//                 isOnline: true,
//               ),
//               ChatRow(
//                 imgURL: 'assets/image/chatAvatars/tobias.jpg',
//                 name: 'Tobias Mold',
//                 msgPreview: 'Trying my best!',
//                 //msgCount: 9,
//                 time: '6:55',
//               ),
//               ChatRow(
//                 name: 'Tilo Fox',
//                 imgURL: 'assets/image/chatAvatars/tilo.jpg',
//                 msgPreview: 'In the dark',
//                 //msgCount: 9,
//                 time: '6:55',
//               ),
//               ChatRow(
//                 name: 'Elena Tonro',
//                 imgURL: 'assets/image/chatAvatars/elena.jpg',
//                 msgPreview: 'Doing the right thing',
//                 //msgCount: 9,
//                 time: '6:55',
//               ),
//             ],
//           ),
//         ),