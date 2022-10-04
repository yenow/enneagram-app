
import 'package:enneagram/get/controller/test_controller.dart';
import 'package:enneagram/get/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/app_controller.dart';
import '../controller/enneagram_description_controller.dart';


class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(EnneagramDescriptionController(), permanent: true);
    // Get.put(TestController());
  }
}