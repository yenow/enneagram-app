import 'package:enneagram/constants.dart';
import 'package:enneagram/data/models/question.dart';
import 'package:enneagram/get/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/test_page.dart';

// ignore: must_be_immutable
class HardTestScreen extends StatelessWidget {
  final List list;

  const HardTestScreen({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // logger.d('TestController.to.questions = ${TestController.to.questions}');
    return Obx(
      () => WillPopScope(
        onWillPop: TestController.to.onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('정밀테스트'),
          ),
          body: PageView(
              controller: TestController.to.pageController,
              children: TestController.to.questions.map((Question element) {
                var index = TestController.to.questions.indexOf(element);
                // TestController.to.index(index);
                return TestPage(question: element, questionIndex: index);
              }).toList()),
        ),
      ),
    );
  }
}
