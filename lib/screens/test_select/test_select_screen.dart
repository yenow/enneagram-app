import 'package:enneagram/get/controller/test_controller.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class TestSelectScreen extends StatelessWidget {
  TestSelectScreen({Key? key}) : super(key: key);

  final List<String> notificationList = [
    "가능한 '3번(보통이다)'는 피해주는게 좋아요.",
    "너무 깊게 생각하지말고 체크해주세요.",
    "솔직하게 체크해주세요.",
    // "세상에 사람을 완벽하게 이해할 수 있는 도구는 없어요. 개인마다 모두 차이가 있어요.",
    // "너무 질문이 많으신가요? 그래도 조금만 참아주세요. 더 정확한 결과를 위해서니까요.",
    // "에니어그램은 내 단점을 통해 찾는게 더 쉬울수 있어요.",
    // "에니어그램을 통해 내 단점을 마주할수 있어요. 하지만 자신의 단점을 마주하면서 너무 자책하지 않아도 되요. 고쳐나가면 되니까요.",
    // "에니어그램을 통해 남을 평가할 필요는 없어요.",
    // "에니어그램은 표지판이에요. 가는 길은 본인이 정해요.",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('테스트하기'),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Flexible(
                      flex: 15,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '테스트시 주의사항',
                                  style: Get.textTheme.headline5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                              width: double.infinity,
                            ),
                            ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: notificationList.map((notification) {
                                int index = notificationList.indexOf(notification) + 1;

                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('$index. $notification',
                                          style: Get.textTheme.bodyText1)),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      )),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            // Get.toNamed(MyRoute.testSelectScreen);
                          },
                          child: const Text('간단테스트')),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                          onPressed: () async {
                            var result = await Get.toNamed(MyRoute.detailTestScreen, arguments: "81");
                            logger.d('result = $result');
                            TestController.to.clearQuestions();
                          },
                          child: const Text('정밀 테스트 (81문항)')),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(MyRoute.detailTestScreen, arguments: "135");
                            TestController.to.clearQuestions();
                          },
                          child: const Text('정밀 테스트 (135문항)')),
                    ),
                  ),
                  Flexible(flex: 2, child: Container()),
                ],
              ),
            )));
  }
}
