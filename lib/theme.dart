import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color primaryColor = Color(0xFF998BE3);

ThemeData theme() {
  return ThemeData(
    appBarTheme: appTheme(),
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    fontFamily: 'cafe24SsurroundAir_KR',
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: Colors.white,
      background: Color(0xFFD7B7FF),
      onBackground: Colors.white,
      secondary: Color(0xFF402572),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ),
    primaryColor: Colors.deepPurple.shade100,
    tabBarTheme: tabBarTheme(),
    elevatedButtonTheme: elevatedButtonThemeData(),
  );
}

TabBarTheme tabBarTheme() {
  return TabBarTheme(
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 4),
        ),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: primaryColor);
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: true,
    toolbarHeight: 40.h,
    backgroundColor: primaryColor,
    elevation: 3.0,
    titleTextStyle: const TextStyle(fontSize: 20, fontFamily: 'cafe24SsurroundAir_KR', color: Colors.white),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headlineLarge: TextStyle(color: Colors.black, fontSize: 30.sp),
    headlineMedium: TextStyle(color: Colors.black, fontSize: 28.sp),
    headlineSmall: TextStyle(color: Colors.black, fontSize: 26.sp),
    titleLarge: TextStyle(color: Colors.black, fontSize: 22.sp),
    titleMedium: TextStyle(color: Colors.black, fontSize: 20.sp),
    titleSmall: TextStyle(color: Colors.black, fontSize: 18.sp),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16.sp),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 14.sp),
    bodySmall: TextStyle(color: Colors.black, fontSize: 12.sp),
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.infinite),
      backgroundColor: MaterialStateProperty.all(primaryColor),
      elevation: MaterialStateProperty.all(4),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: const BorderSide(color: Colors.black87)
        ),
      ),
    ),
  );
}
