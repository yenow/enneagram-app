import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/constants.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/data/models/question/question.dart';
import 'package:enneagram/data/models/question/question_type.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/enneagram_result/enneagram_result_function.dart';
import '../../data/models/enneagram_result/score.dart';
import '../../data/models/user/user.dart';
import '../../utilities/dialog.dart';
import 'app_controller.dart';

class TestController extends GetxController {
  static TestController get to => Get.find();
  final questions = <Question>[].obs;
  final currentQuestion = Rx<Question>;
  final pageIndex = 0.obs;

  // const
  final PageController pageController = PageController();
  final Duration duration = const Duration(milliseconds: 200);
  final Curve curve = Curves.linear;

  @override
  void onInit() {
    super.onInit();
  }

  /*
   * 초기 테스트 설정
   */
  void initHardTest(QuestionType questionCount) {
    questions([]);
    pageIndex(0);

    switch (questionCount) {
      case QuestionType.question45 :
        detailTest_45Questions.shuffle();
        questions.addAll(detailTest_45Questions);
        break;
      case QuestionType.question81 :
        detailTest_81Questions.shuffle();
        questions.addAll(detailTest_81Questions);
        break;
      case QuestionType.question135 :
        detailTest_135Questions.shuffle();
        questions.addAll(detailTest_135Questions);
        break;
      default :

    }
  }

  Future<bool> onWillPop() async {
    bool result = false;

    await Get.dialog(AlertDialog(
      title: Text(
        '알림',
        style: Get.textTheme.titleMedium,
      ),
      content: Text(
        '테스트를 그만하시겠습니까?',
        style: Get.textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          child: Text(
            "예",
            style: Get.textTheme.bodyLarge,
          ),
          onPressed: () {
            Get.back();
            result = true;
          },
        ),
        TextButton(
          child: Text("아니요", style: Get.textTheme.bodyLarge),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ));

    return result;
  }

  void goPrevTenPage() {
    int index = pageIndex.value - 10;

    if (index < 0) index = 0;

    pageController.jumpToPage(index);
    pageIndex(index);
  }

  void goNextTenPage() {
    int index = pageIndex.value + 10;

    while(questions.elementAt(index).score == null) {
      index--;
    }
    index++;

    if (pageIndex.value == questions.length - 1) {
      alertDialog('마지막 페이지 입니다.');
    } else if (index == pageIndex.value)  {
      alertDialog('문항을 선택해야 합니다.');
    }

    pageController.jumpToPage(index);
    pageIndex(index);
  }

  /*
   * 다음 페이지로 이동
   */
  void goNextPage(int questionIndex) {
    Question question = questions.elementAt(pageIndex.value);

    logger.d('current index = ${pageIndex.value} ${questions.length}');

    if (questionIndex == questions.length - 1) {
      alertDialog('마지막 페이지 입니다.');
    } else if (question.score == null) {
      alertDialog('문항을 선택해야합니다.');
    } else {
      TestController.to.pageController.nextPage(
          duration: TestController.to.duration, curve: TestController.to.curve);
      pageIndex(pageIndex.value + 1);
    }
  }

  /*
   * 이전 페이지로 이동
   */
  void goPrevPage(int questionIndex) {
    if (questionIndex == 0) {
      alertDialog('첫번쨰 페이지 입니다.');
    } else {
      TestController.to.pageController.previousPage(
          duration: TestController.to.duration, curve: TestController.to.curve);
      pageIndex(pageIndex.value - 1);
    }
  }

  double getProgressPercent() {
    int length = questions.length;

    int cnt = 0;
    for (Question element in questions) {
      if (element.score != null) {
        cnt++;
      }
    }

    return cnt / length;
  }

  /**
   * 점수 클릭시
   */
  Future<void> clickScore(int buttonNumber) async {
    pageIndex(pageIndex.value + 1);
    logger.d('current index = ${pageIndex.value} ${questions.length}');

    if (pageIndex.value < questions.length) {
      TestController.to.pageController.nextPage(duration: duration, curve: curve);
    } else if (pageIndex.value == questions.length) {
      await completeDetailTest();
    }
  }

  void onPageChanged(int index) {
    pageIndex(index);
    logger.d("current page index : ${index} , controller pageIndex : ${pageIndex}");
  }

  void clearQuestions() {
    questions([]);
  }

  /// 테스트 완료시
  Future<void> completeDetailTest() async {
    // check data
    for (Question question in questions) {
      if (question.score == null) {
        logger.d('score is null');
        return;
      }
    }

    // create scores
    List<Score> scores = questions.map((element) {
      return Score(
          enneagramType: element.enneagramType!, score: element.score!);
    }).toList();

    // calculate enneagramType
    Map<int, double> enneagramScore = getEnneagramScoreSumMap(scores);
    int enneagramType = getHighestEnneagramType(enneagramScore);

    // create enneagramResult
    EnneagramResult enneagramResult = EnneagramResult(
        enneagramType: enneagramType,
        questionType: questions.elementAt(0).questionType,
        scores: scores,
        createdAt: DateTime.now());

    // create user
    User user = AppController.to.user.value;

    if (user.enneagramResults.isEmpty) {
      user.enneagramResults.add(enneagramResult);
    } else {
      user.enneagramResult = enneagramResult;
      user.enneagramResults.insert(0,enneagramResult);
    }

    // save to firebase
    logger.d("userToken : ${AppController.to.getUserToken()}");
    List<QueryDocumentSnapshot<User>> users = await AppController.to.userRef
        .where('userToken', isEqualTo: AppController.to.getUserToken())
        .get()
        .then((snapshot) => snapshot.docs);

    if (!user.enneagramResults.isEmpty) {
      // await AppController.to.userRef.doc(users.first.id).delete();
      await AppController.to.userRef.doc(users.first.id).update(user.toJson());
    } else {
      await AppController.to.userRef.add(user);
    }

    Get.toNamed(AppRoute.root);
  }
}
