import 'package:flutter/material.dart';
import 'package:lofi/constants.dart';

class Tag extends StatelessWidget {
  Tag(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tag tapped');
      },
      child: Chip(
          padding: EdgeInsets.all(10),
          backgroundColor: kBottomMenuBG,
          label: Text(
            '#$text',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )),
    );
  }
}
