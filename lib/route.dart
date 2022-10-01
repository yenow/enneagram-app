import 'package:enneagram/get/controller/test_controller.dart';
import 'package:enneagram/screens/home/home_screen.dart';
import 'package:enneagram/screens/splash_screen.dart';
import 'package:enneagram/screens/test/detail_test_screen.dart';
import 'package:enneagram/screens/test_select/test_select_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'constants.dart';
import 'get/binding/test_controller_binding.dart';

class MyRoute {
  static const String root = '/';
  static const String splashScreen = '/splashScreen';
  static const String testSelectScreen = '/testSelectScreen';
  static const String detailTestScreen = '/detailTestScreen';

  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(name: root, page: () => const HomeScreen()),
      GetPage(name: splashScreen, page: () => const SplashScreen()),
      GetPage(name: testSelectScreen, page: () => TestSelectScreen()),
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
