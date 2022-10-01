import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/constants.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/data/models/question.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/score.dart';
import '../../data/models/user.dart';
import '../../utilities/dialog.dart';
import 'app_controller.dart';

class TestController extends GetxController {
  static TestController get to => Get.find();
  final questions = <Question>[].obs;
  final currentQuestion = Rx<Question>;
  final index = 0.obs;

  // const
  final PageController pageController = PageController();
  final Duration duration = const Duration(milliseconds: 300);
  final Curve curve = Curves.linear;

  @override
  void onInit() {
    super.onInit();
    logger.d("TestController init()");
  }

  void initSimpleTest() {
    questions.addAll(simpleTestQuestions);
  }

  void initDetailTest135() {
    logger.d("initDetailTest135()");
    detailTest_135Questions.shuffle();
    questions.addAll(detailTest_135Questions);
  }

  void initDetailTest81() {
    logger.d("initDetailTest81()");
    detailTest_81Questions.shuffle();
    questions.addAll(detailTest_81Questions);
  }

  Future<bool> onWillPop() async {
    bool result = false;

    await Get.dialog(AlertDialog(
      title: Text(
        '알림',
        style: Get.textTheme.subtitle1,
      ),
      content: Text(
        '테스트를 그만하시겠습니까?',
        style: Get.textTheme.bodyText1,
      ),
      actions: [
        TextButton(
          child: Text(
            "예",
            style: Get.textTheme.bodyText1,
          ),
          onPressed: () {
            Get.back();
            result = true;
          },
        ),
        TextButton(
          child: Text("아니요", style: Get.textTheme.bodyText1),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ));

    return result;
  }

  void goNextPage(int questionIndex) {
    Question question = questions.elementAt(index.value);

    logger.d('current index = ${index.value} ${questions.length}');

    if (questionIndex == questions.length - 1) {
      alertDialog('마지막 페이지 입니다.');
    } else if (question.score == null) {
      alertDialog('문항을 선택해야합니다.');
    } else {
      index(index.value + 1);
      TestController.to.pageController.nextPage(
          duration: TestController.to.duration, curve: TestController.to.curve);
    }
  }

  void goPrevPage(int questionIndex) {
    if (questionIndex == 0) {
      alertDialog('첫번쨰 페이지 입니다.');
    } else {
      index(index.value - 1);
      TestController.to.pageController.previousPage(
          duration: TestController.to.duration, curve: TestController.to.curve);
    }
  }

  void clickScore(int buttonNumber) {
    index(index.value + 1);
    logger.d('current index = ${index.value} ${questions.length}');

    if (index.value < questions.length) {
      TestController.to.pageController
          .nextPage(duration: duration, curve: curve);
    } else if (index.value == questions.length) {
      completeDetailTest();
    }
  }

  void clearQuestions() {
    logger.d('clearQuestions() execute');
    questions([]);
  }

  void completeDetailTest() async {
    // check data
    for (Question question in questions) {
      if (question.score == null) {
        logger.d('score is null');
        return;
      }
    }

    List<Score> scores = questions.map((element) {
      return Score(
          enneagramType: element.enneagramType!, score: element.score!);
    }).toList();

    // calculate enneagramType
    Map<int, int> enneagramScore = {};
    for (Score score in scores) {
      enneagramScore[score.enneagramType] =
          (enneagramScore[score.enneagramType] ?? 0) + score.score;
    }

    int maxScore = 0;
    int enneagramType = 0;
    enneagramScore.forEach((key, value) {
      if (enneagramScore[key]! > maxScore) {
        enneagramType = key;
      } else if (enneagramScore[key]! == maxScore) {
        // if (enneagramScore[(key-1)%9]! + enneagramScore[(key+1)%9]! < enneagramScore[(enneagramType-1)%9]! + enneagramScore[(enneagramType+1)%9]!) {
        //
        // }
        enneagramType = key;
      }
    });

    EnneagramResult enneagramResult = EnneagramResult(
        enneagramType: enneagramType,
        questionType: questions.elementAt(0).questionType,
        scores: scores,
        createdAt: DateTime.now());

    User user = AppController.to.user.value;
    user.enneagramResults.add(enneagramResult);
    User newUser = User(
        userToken: user.userToken,
        createdAt: user.createdAt,
        enneagramResults: user.enneagramResults,
        enneagramResult: enneagramResult);
    AppController.to.user(newUser);

    // save to firebase
    List<QueryDocumentSnapshot<User>> users = await AppController.to.userRef
        .where('userToken', isEqualTo: AppController.to.getUserToken())
        .get()
        .then((snapshot) => snapshot.docs);

    AppController.to.userRef.doc(users.first.id).update(newUser.toJson());

    Get.toNamed(MyRoute.root);
  }

  // getEnneagramResult() {
  //   String userToken = AppController.to.getUserToken();
  //   FirebaseFirestore.instance
  //       .collection('user')
  //       .where('userToken', isEqualTo: userToken)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.first.reference
  //         .collection('enneagramResult')
  //         .get()
  //         .then((QuerySnapshot querySnapshot) {
  //       if (querySnapshot.docs.isNotEmpty) {
  //         for (var element in querySnapshot.docs) {}
  //       }
  //     });
  //   });
  // }
}
