import 'package:enneagram/constants.dart';
import 'package:enneagram/data/models/question/question.dart';
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
    return Obx(
      () => WillPopScope(
        onWillPop: TestController.to.onWillPop,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('테스트'),
            ),
            body: PageView(
              controller: TestController.to.pageController,
              onPageChanged: TestController.to.onPageChanged,
              children: TestController.to.questions.map((Question question) {
                var index = TestController.to.questions.indexOf(question);
                return TestPage(question: question, questionIndex: index);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
