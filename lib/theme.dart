import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appTheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    fontFamily: 'cafe24SsurroundAir_KR',
    colorScheme: const ColorScheme(
      primary: Colors.deepPurple,
      onPrimary: Colors.white,
      background: Color(0xFFD7B7FF),
      onBackground: Colors.white,
      secondary: Color(0xFF402572),
      //Color(0xFF3A0F65),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ),
    primaryColor: Colors.deepPurple.shade100,
    tabBarTheme: tabBarTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.infinite),
      backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade400),
      elevation: MaterialStateProperty.all(4),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        // side: const BorderSide(color: Colors.black87)
      )),
      // textStyle: MaterialStateProperty.all(const TextStyle(
      //   fontSize: 15,
      //   color: Colors.black87
      // )),
    )),
  );
}

TabBarTheme tabBarTheme() {
  return TabBarTheme(
    indicator: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 4))),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey.shade300
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
      centerTitle: true,
      // color: Colors.white,
      // backgroundColor: Colors.deepPurple,
      backgroundColor: Colors.deepPurple.shade400,
      elevation: 3.0,
      titleTextStyle: const TextStyle(fontSize: 20, fontFamily: 'cafe24SsurroundAir_KR', color: Colors.white));
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontSize: 34,
      wordSpacing: 1.2,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 32,
      wordSpacing: 1.2,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 30,
      wordSpacing: 1.2,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 26,
      wordSpacing: 1.2,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontSize: 24,
      wordSpacing: 1.2,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 22,
      wordSpacing: 1.2,
      color: Colors.black,
    ),
    subtitle1: TextStyle(color: Colors.black, fontSize: 20),
    subtitle2: TextStyle(color: Colors.black, fontSize: 18),
    bodyText1: TextStyle(color: Colors.black, fontSize: 16),
    bodyText2: TextStyle(color: Colors.black, fontSize: 14),
  );
}
