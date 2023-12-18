import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/common/object/device_info.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/data/models/question/question.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../common/function/device_info_function.dart';
import '../../constants.dart';
import '../../data/models/user/user.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final user = User(
          userToken: 'init',
          enneagramResult: EnneagramResult(
              enneagramType: 0,
              scores: [],
              questionType: QuestionType.detail45,
              createdAt: DateTime.now()),
          enneagramResults: [
            EnneagramResult(
                enneagramType: 0,
                scores: [],
                questionType: QuestionType.detail45,
                createdAt: DateTime.now())
          ],
          createdAt: DateTime.now())
      .obs;

  final userRef = FirebaseFirestore.instance
      .collection('user')
      .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (enneagramResult, _) => enneagramResult.toJson());

  late DeviceInfo deviceInfo;
  late PackageInfo packageInfo;
  late SharedPreferences prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> initData() async {
    await initUser();

    deviceInfo = await getDeviceInfo();
    packageInfo = await PackageInfo.fromPlatform();

    return true;
  }

  Future<void> initUser() async {
    await initSharedPreferences();

    logger.d('initUser() execute');
    String? userToken = prefs.getString('userToken');
    userToken = 'ca5cdaa0-5d16-11ed-af3f-990da4a3018e';

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
        logger.d(findUser);
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
          questionType: QuestionType.detail45,
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
