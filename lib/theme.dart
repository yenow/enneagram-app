import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appTheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    fontFamily: 'cafe24SsurroundAir_KR',
    colorScheme: const ColorScheme(
      primary: Color(0xFF7033B9),
      onPrimary: Colors.white,
      background: Color(0xFFA990C7),
      onBackground: Colors.white,
      secondary: Color(0xFF3A0F65),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ),
    primaryColor: Colors.purple.shade300,
    tabBarTheme: tabBarTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.infinite),
      elevation: MaterialStateProperty.all(1),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )),
    )),
  );
}

TabBarTheme tabBarTheme() {
  return TabBarTheme(
      indicator: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Colors.deepPurple.shade200, width: 4))));
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
