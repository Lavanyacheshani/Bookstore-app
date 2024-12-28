import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xff4E89AE); // Calm blue
  static Color get primaryLight => const Color(0xffA2D5F2); // Light blue
  static Color get text =>
      const Color(0xff1B1B1B); // Dark text color for readability
  static Color get subTitle =>
      const Color(0xff1B1B1B).withOpacity(0.5); // Subtle dark gray

  static Color get color1 => const Color(0xffFFD700); // Golden yellow
  static Color get color2 => const Color(0xffFF6F61); // Warm coral

  static Color get dColor => const Color(0xffF9F9F9); // Light background color

  static Color get textbox => const Color(0xffE8E8E8)
      .withOpacity(0.8); // Slightly lighter textbox background

  static List<Color> get button => const [
        Color(0xff4E89AE), // Matching primary
        Color(0xff76C7C0), // Soft mint green
      ];

  static List<Color> get searchBGColor => const [
        Color(0xffFFABAB), // Light coral pink
        Color(0xffFFC947), // Bright yellow
        Color(0xffFF6663), // Bold reddish pink
        Color(0xffFFA500), // Orange
        Color(0xff6EC1E4), // Soft blue
        Color(0xffC48C7C), // Warm beige
      ];
}
