import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/data/models/question/question.dart';
import 'package:enneagram/get/controller/enneagram_description_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../data/models/user/user.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final user = User(
          userToken: 'init',
          enneagramResult: EnneagramResult(
              enneagramType: 0,
              scores: [],
              questionType: QuestionType.simple,
              createdAt: DateTime.now()),
          enneagramResults: [
            EnneagramResult(
                enneagramType: 0,
                scores: [],
                questionType: QuestionType.simple,
                createdAt: DateTime.now())
          ],
          createdAt: DateTime.now())
      .obs;

  final userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (enneagramResult, _) => enneagramResult.toJson());

  late SharedPreferences prefs;

  Future<void> initSharedPreferences() async {
    logger.d('initSharedPreferences() execute');
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> initData() async {
    await initUser();
    await EnneagramDescriptionController.to.initEnneagramDescription();

    // var singleFile = await DefaultCacheManager().getSingleFile('http://ysy.dothome.co.kr/type1/main.html');
    // logger.d(singleFile);
    //
    // for (int enneagramType = 1;enneagramType<10;enneagramType++) {
    //   DefaultCacheManager().getSingleFile('http://ysy.dothome.co.kr/type$enneagramType/main.html');
    //   DefaultCacheManager().getSingleFile('http://ysy.dothome.co.kr/type$enneagramType/good.html');
    //   DefaultCacheManager().getSingleFile('http://ysy.dothome.co.kr/type$enneagramType/wise_saying.html');
    //   DefaultCacheManager().getSingleFile('http://ysy.dothome.co.kr/type$enneagramType/wing.html');
    // }

    return true;
  }

  Future<void> initUser() async {
    await initSharedPreferences();

    logger.d('initUser() execute');
    String? userToken = prefs.getString('userToken');

    if (userToken == null) {
      userToken = const Uuid().v1();
      createUser(userToken);

    } else {
      logger.d('userToken : $userToken');
      List<QueryDocumentSnapshot<User>> users = await userRef
          .where('userToken', isEqualTo: userToken)
          .get()
          .then((snapshot) => snapshot.docs);

      if (users.isNotEmpty) {
        User findUser = users.first.data();
        user(findUser);
      } else {
        userToken = const Uuid().v1();
        createUser(userToken);
      }
    }
    logger.d('user = $user');
  }

  void createUser(String userToken) {
    User createdUser = User(
      userToken: userToken,
      createdAt: DateTime.now(),
      enneagramResult: EnneagramResult(
          enneagramType: 0,
          scores: [],
          questionType: QuestionType.simple,
          createdAt: DateTime.now()),
      enneagramResults: [],
    );

    // save firebase
    userRef.add(createdUser);

    // save SharedPreferences
    prefs.setString('userToken', userToken);

    user(createdUser);
  }

  String getUserToken() {
    String? userToken = prefs.getString('userToken');
    return userToken ?? '';
  }

  void removeUserToken() {
    prefs.remove('userToken');
  }
}
