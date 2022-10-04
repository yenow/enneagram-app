import 'package:flutter/material.dart';

const Color customMagenta300 = Color(0xfff8836c);

ThemeData theme() {
  return ThemeData(
    appBarTheme: appTheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    fontFamily: 'cafe24SsurroundAir_KR',
    // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xB446C7FF), ),
    // colorScheme: ColorScheme(
    //   background: Colors.purple, brightness: Brightness(),
    //
    // ),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        // primaryColorDark: Colors.grey,
        // backgroundColor: Colors.purple.shade200,
        // accentColor: Colors.purple.shade200
    ),
    primaryColor: Colors.purple.shade300,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.infinite),
        // textStyle: MaterialStateProperty.all(GoogleFonts.jua()),
        // backgroundColor: MaterialStateProperty.all(WaiColors.mainColor),
        // overlayColor: MaterialStateProperty.all(WaiColors.mainColor),
        elevation: MaterialStateProperty.all(1),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )
        ),
      )
    ),
  );
}

AppBarTheme appTheme() {
  return const AppBarTheme(
      centerTitle: true,
      // color: Colors.white,
      // backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'cafe24SsurroundAir_KR',
          color: Colors.white));
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontSize: 30,
    ),
    headline2: TextStyle(
      fontSize: 28,
    ),
    headline5: TextStyle(
      fontSize: 24,
    ),
    headline6: TextStyle(
      fontSize: 22,
    ),
    subtitle1: TextStyle(color: Colors.black, fontSize: 20),
    subtitle2: TextStyle(color: Colors.black, fontSize: 18),
    bodyText1: TextStyle(color: Colors.black, fontSize: 16),
    bodyText2: TextStyle(color: Colors.black, fontSize: 14),
  );
}
