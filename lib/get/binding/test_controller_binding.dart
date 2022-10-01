import 'package:enneagram/get/controller/test_controller.dart';
import 'package:enneagram/get/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/app_controller.dart';


class TestControllerBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(TestController());
  }
}