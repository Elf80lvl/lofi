import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

class WhatsPlayingButton extends StatelessWidget {
  const WhatsPlayingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: GestureDetector(
        onTap: () {
          print('whats playing was tapped');
        },
        child: Chip(
          avatar: SvgPicture.asset('assets/icons/whatsPlaying.svg'),
          backgroundColor: kMainWhite,
          padding: EdgeInsets.all(12),
          label: Text(
            'What\'s playing?',
            style: TextStyle(
                color: kBgColor, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
