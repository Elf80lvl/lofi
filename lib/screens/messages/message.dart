import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

// class Message extends StatelessWidget {
//   const Message({
//     Key key,
//     this.message,
//     this.time,
//     this.isMe,
//   }) : super(key: key);

//   final String message, time;
//   final bool isMe;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 7),
//       child: Row(
//         children: [
//           isMe
//               ? Expanded(
//                   child: Container(),
//                 )
//               : SizedBox(),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//             decoration: BoxDecoration(
//               color: isMe ? kMainWhite : kBottomMenuBG,
//               borderRadius: isMe
//                   ? BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     )
//                   : BorderRadius.only(
//                       bottomRight: Radius.circular(30),
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   message,
//                   //overflow: TextOverflow.clip,
//                   //textAlign: TextAlign.right,
//                   style: TextStyle(
//                       color: isMe ? kBgColor : kMainWhite,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(
//                   width: 16,
//                 ),
//                 Text(
//                   time,
//                   style: TextStyle(
//                       color: kSecondaryColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 isMe // TODO Индикатор отправки сообщения
//                     ? Row(
//                         children: [
//                           SizedBox(
//                             width: 16,
//                           ),
//                           SvgPicture.asset('assets/icons/msgChecked.svg')
//                         ],
//                       )
//                     : SizedBox(),
//               ],
//             ),
//           ),
//           isMe
//               ? SizedBox()
//               : Expanded(
//                   child: Container(),
//                 ),
//         ],
//       ),
//     );
//   }
// }

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
    return Container(
      padding: EdgeInsets.only(
          top: 4, bottom: 4, left: isMe ? 0 : 0, right: isMe ? 0 : 0),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: isMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: isMe
                  ? [kMainWhite, kMainWhite]
                  : [kBottomMenuBG, kBottomMenuBG],
            )),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: isMe ? kBgColor : kMainWhite,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
