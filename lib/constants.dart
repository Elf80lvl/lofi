import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const kBgColor = Color(0XFF1D2027);
const kMainWhite = Color(0XFFDFE0E8);
const kBottomMenuBG = Color(0XFF272B35);
const kBottomIconsColor = Color(0XFF525B6D);
const kSecondaryColor = Color(0XFF798294);
const kThemeColor = Color(0XFF3C95E8);

var kTextFieldInputDecoration = InputDecoration(
  icon: SvgPicture.asset('assets/icons/Search2.svg'),
  suffixStyle: TextStyle(color: Colors.white),
  hintText: 'Find in library',
  contentPadding: EdgeInsets.all(0),
  hintStyle: TextStyle(
    color: kSecondaryColor,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
);
