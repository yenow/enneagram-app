import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/get/controller/app_controller.dart';
import 'package:enneagram/route.dart';
import 'package:enneagram/screens/home/components/custom_drawer.dart';
import 'package:enneagram/screens/home/components/enneagram_container.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/models/question/question.dart';
import '../../data/models/enneagram_result/score.dart';

final Future<String> calculation = Future<String>.delayed(
  Duration(seconds: 2),
  () => 'Y',
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d('build HomeScreen');

    // return buildBody();

    return FutureBuilder<bool>(
        future: AppController.to.initData(),
        // future: calculation,
        // initialData: AppController.to.initUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return buildBody();
            } else {
              return const Text('error');
            }
          } else if (snapshot.hasError) {
            return const Text('error');
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          ));
        });
  }

  Widget buildBody() {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('에니어그램',),
          ),
          drawer: CustomDrawer(
              enneagramType:
                  AppController.to.user.value.enneagramResult!.enneagramType),
          body: Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 12,
                    child: EnneagramContainer(
                      shape: Shape.vertical,
                      enneagramType: AppController.to.user.value.enneagramResult!.enneagramType,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(MyRoute.testSelectScreen);
                        },
                        child: Text('에니어그램 알아보기')),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(MyRoute.testSelectScreen);
                      },
                      child: Text('에니어그램 테스트하기'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(flex: 2, child: Container()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
