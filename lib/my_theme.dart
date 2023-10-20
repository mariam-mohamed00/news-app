import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff39A552);
  static Color textColor = Color(0xff4F5A69);
  static Color blackColor = Color(0xff303030);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color redColor = Color(0xffC91C22);
  static Color blueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color cyanColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color purpleColor = Color(0xffBC52F2);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryLight, elevation: 0),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: primaryLight),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
    ),
  );
}
