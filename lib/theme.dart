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
