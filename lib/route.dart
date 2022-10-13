import 'package:enneagram/get/controller/test_controller.dart';
import 'package:enneagram/screens/enneagram_detail_description/enneagram_detail_description.dart';
import 'package:enneagram/screens/enneagram_introduction/enneagram_introduction_register_screen.dart';
import 'package:enneagram/screens/enneagram_introduction/enneagram_introduction_screen.dart';
import 'package:enneagram/screens/enneagram_type_description/enneaegram_type_description_screen.dart';
import 'package:enneagram/screens/home/home_screen.dart';
import 'package:enneagram/screens/setting/setting_screen.dart';
import 'package:enneagram/screens/splash_screen.dart';
import 'package:enneagram/screens/test/detail_test_screen.dart';
import 'package:enneagram/screens/test_select/test_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import 'constants.dart';
import 'get/binding/enneagram_introduction_controller_binding.dart';
import 'get/binding/test_controller_binding.dart';
import 'get/controller/enneagram_description_controller.dart';

class MyRoute {
  static const String root = '/';
  static const String splashScreen = '/splashScreen';
  static const String testSelectScreen = '/testSelectScreen';
  static const String enneagramIntroduction = '/enneagramIntroduction';
  static const String enneagramIntroductionRegister = '/enneagramIntroductionRegister';
  static const String enneagramTypeDescription = '/enneagramTypeDescription';
  static const String enneagramDetailDescription = '/enneagramDetailDescription';
  static const String detailTestScreen = '/detailTestScreen';
  static const String settingScreen = '/settingScreen';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: root, page: () => const HomeScreen()),
      GetPage(name: splashScreen, page: () => const SplashScreen()),
      GetPage(name: testSelectScreen, page: () => TestSelectScreen()),
      GetPage(name: settingScreen, page: () => const SettingScreen()),
      GetPage(name: enneagramTypeDescription, page: () {
        int enneagramType = Get.arguments;
        return EnneagramTypeDescriptionScreen(enneagramType: enneagramType);
      }),
     GetPage(name: enneagramDetailDescription, page: () {
        int enneagramType = Get.arguments;
        return EnneagramDetailDescription(enneagramType: enneagramType);
      }),
      GetPage(
          name: enneagramIntroduction,
          page: () => const EnneagramIntroductionScreen(),
          binding: EnneagramIntroductionControllerBinding()),
      GetPage(
          name: enneagramIntroductionRegister,
          page: () => const EnneagramIntroductionRegisterScreen(),
          binding: EnneagramIntroductionControllerBinding()),
      GetPage(
        name: detailTestScreen,
        page: () {
          var data = Get.arguments;
          if (data == "81") {
            TestController.to.initDetailTest81();
          } else {
            TestController.to.initDetailTest135();
          }

          return HardTestScreen(list: TestController.to.questions);
        },
        binding: TestControllerBinding(),
      )
    ];
  }
}
