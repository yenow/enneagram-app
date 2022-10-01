import 'package:enneagram/get/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/question.dart';

class TestPage extends StatefulWidget {
  final Question question;
  final int questionIndex;

  const TestPage({
    Key? key,
    required this.question,
    required this.questionIndex,
  }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey, width: 1),
            //     borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 10,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.skip_previous,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      TestController.to.goPrevPage(widget.questionIndex);
                                    },
                                    icon: const Icon(
                                      Icons.navigate_before,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${widget.questionIndex + 1} / ${TestController.to.questions.length}',
                                        style: Get.textTheme.headline6,
                                      )),
                                  // 다음 페이지로
                                  IconButton(
                                    onPressed: () {
                                      TestController.to.goNextPage(widget.questionIndex);
                                    },
                                    icon: const Icon(
                                      Icons.navigate_next,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.skip_next,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              );
                            })),
                        // Flexible(
                        //     child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     '1 / 10',
                        //     style: Get.textTheme.headline6,
                        //   ),
                        // )),
                        Flexible(
                            fit: FlexFit.loose,
                            flex: 7,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '${widget.questionIndex + 1}. ${widget.question.question}',
                                style: Get.textTheme.headline6,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                buildFlexibleButton(1),
                buildFlexibleButton(2),
                buildFlexibleButton(3),
                buildFlexibleButton(4),
                buildFlexibleButton(5),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Flexible buildFlexibleButton(int buttonNumber) {
    return Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.question.score = buttonNumber;
              });
              TestController.to.clickScore(buttonNumber);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                Question elementAt = TestController.to.questions.elementAt(widget.questionIndex);
                if (widget.question.score == buttonNumber) {
                  logger.d('widget.question.score = ${widget.question.score}');
                  return Colors.grey;
                }
                return Colors.blue;
              })
            ),
            child: Text(getButtonString(buttonNumber)),
          ),
        ));
  }

  String getButtonString(int buttonNumber) {
    switch (buttonNumber) {
      case 1:
        return '1번(매우 그렇지 않다)';
      case 2:
        return '2번(그렇지 않다)';
      case 3:
        return '3번(보통이다)';
      case 4:
        return '4번(그렇다)';
      case 5:
        return '5번(매우 그렇다)';
    }
    return '';
  }
}
