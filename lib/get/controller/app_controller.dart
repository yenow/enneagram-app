import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/data/models/question.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../data/models/user.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final user = User(
          userToken: 'init',
          enneagramResult: EnneagramResult(
              enneagramType: 0,
              scores: [],
              questionType: QuestionType.simple,
              createdAt: DateTime.now()),
          enneagramResults: [],
          createdAt: DateTime.now())
      .obs;

  final userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (enneagramResult, _) => enneagramResult.toJson());

  late SharedPreferences prefs;

  @override
  void onInit() async {
    await initSharedPreferences();
    await initUser();
    super.onInit();
  }

  Future<void> initSharedPreferences() async {
    logger.d('initSharedPreferences() execute');
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> initUser() async {
    logger.d('initUser() execute');
    String? userToken = prefs.getString('userToken');

    if (userToken == null) {
      userToken = const Uuid().v1();

      User createdUser = User(
        userToken: userToken,
        createdAt: DateTime.now(),
        enneagramResults: [],
      );

      // save firebase
      userRef.add(createdUser);

      // save SharedPreferences
      prefs.setString('userToken', userToken);

      user(createdUser);
    } else {
      logger.d('userToken : $userToken');

      List<QueryDocumentSnapshot<User>> users = await userRef
          .where('userToken', isEqualTo: userToken)
          .get()
          .then((snapshot) => snapshot.docs);

      User findUser = users.first.data();
      user(findUser);
    }
    logger.d('user = $user');
  }

  String getUserToken() {
    String? userToken = prefs.getString('userToken');
    return userToken ?? '';
  }

  void removeUserToken() {
    prefs.remove('userToken');
  }
}
