import 'package:enneagram/get/controller/enneagram_introduction_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class EnneagramIntroductionControllerBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(EnneagramIntroductionController());
  }
}