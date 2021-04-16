import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

class Message extends StatelessWidget {
  const Message({
    Key key,
    this.message,
    this.time,
    this.isMe,
  }) : super(key: key);

  final String message, time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: Row(
        children: [
          isMe
              ? Expanded(
                  child: Container(),
                )
              : SizedBox(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: isMe ? kMainWhite : kBottomMenuBG,
              borderRadius: isMe
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  : BorderRadius.only(
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
                      color: isMe ? kBgColor : kMainWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  time,
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                isMe // TODO Индикатор отправки сообщения
                    ? Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset('assets/icons/msgChecked.svg')
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
          isMe
              ? SizedBox()
              : Expanded(
                  child: Container(),
                ),
        ],
      ),
    );
  }
}
