import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xff4E89AE); 
  static Color get primaryLight => const Color(0xffA2D5F2); 
  static Color get text =>
      const Color(0xff1B1B1B); 
  static Color get subTitle =>
      const Color(0xff1B1B1B).withOpacity(0.5); 

  static Color get color1 => const Color(0xffFFD700); 
  static Color get color2 => const Color(0xffFF6F61);

  static Color get dColor => const Color(0xffF9F9F9); 

  static Color get textbox => const Color(0xffE8E8E8)
      .withOpacity(0.8); 

  static List<Color> get button => const [
        Color(0xff4E89AE), 
        Color(0xff76C7C0), 
      ];

  static List<Color> get searchBGColor => const [
        Color(0xffFFABAB), 
        Color(0xffFFC947), 
        Color(0xffFF6663), 
        Color(0xffFFA500),
        Color(0xff6EC1E4), 
        Color(0xffC48C7C), // Warm beige
      ];
}
