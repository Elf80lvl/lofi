import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lofi/constants.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  hintText: 'Find artist, album, song'),
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: 58,
          ),
          GestureDetector(
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
          SizedBox(
            height: 58,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Recent searches',
                  style: TextStyle(
                    color: kMainWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: Row(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kBorderRadiusDefault),
                          child: Image.asset(
                            'assets/image/woodkid.jpg',
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Iron',
                            style: TextStyle(
                                color: kMainWhite,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Woodkid',
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          icon: SvgPicture.asset('assets/icons/more.svg'),
                          onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Tag('Blues'),
                Tag('Business'),
                Tag('Brazilian'),
                Tag('Chill'),
                Tag('Classical'),
                Tag('Country'),
                Tag('EDM'),
                Tag('Education'),
                Tag('Electronic'),
                Tag('Folk'),
                Tag('Gaming'),
                Tag('Indie'),
                Tag('Jazz'),
                Tag('K-pop'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
