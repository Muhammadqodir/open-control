import 'package:flutter/material.dart';

// main backGround gradient color
const homePageBackColor = Color(0xff121111);
const homePageSecondColor = Color.fromRGBO(124, 1, 246, 0);

// text colot
const textPrimaryColor = Color(0xff4B4A4C);
const textSecondaryColor = Color(0xFF4D4C4E);

const kPrimaryColor = Color(0xFF1F1F1F);
const kContentColorLightTheme = Color(0xFFC8C8C8);
const kContentColorDarkTheme = Color(0xFFF5FCF9);

final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(colors: [
    Color.fromARGB(63, 241, 242, 246),
    Color.fromARGB(49, 241, 242, 246),
    Color.fromARGB(21, 201, 198, 198),
  ]),
  borderRadius: BorderRadius.circular(22),
);
