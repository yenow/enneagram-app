import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appTheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    // textTheme: GoogleFonts.juaTextTheme(),
    // primaryTextTheme: GoogleFonts.juaTextTheme(),
    fontFamily: 'cafe24SsurroundAir_KR',

    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: WaiColors.lightBlueGrey,
    //   elevation: 1
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.infinite),
      // textStyle: MaterialStateProperty.all(GoogleFonts.jua()),
      // backgroundColor: MaterialStateProperty.all(WaiColors.mainColor),
      // overlayColor: MaterialStateProperty.all(WaiColors.mainColor),
      elevation: MaterialStateProperty.all(1),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )),
    )),
  );
}

AppBarTheme appTheme() {
  return const AppBarTheme(
      centerTitle: true,
      // color: Colors.white,
      // backgroundColor: Colors.transparent,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          fontSize: 22, fontFamily: 'cafe24_KR', color: Colors.black54));
}


TextTheme textTheme() {
  return TextTheme(
    headline1: const TextStyle(
      fontSize: 25,
      fontFamily: 'cafe24_KR',
    ),
    headline2: const TextStyle(
      fontSize: 22,
      fontFamily: 'cafe24_KR',
    ),
    subtitle1: const TextStyle(color: Colors.black, fontSize: 22),
    subtitle2: const TextStyle(color: Colors.black, fontSize: 20),
    bodyText1: const TextStyle(color: Colors.black, fontSize: 18),
    bodyText2: const TextStyle(color: Colors.black, fontSize: 16),
  );
}
