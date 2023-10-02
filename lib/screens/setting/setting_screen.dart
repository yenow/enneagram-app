import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants.dart';
import '../../data/models/enneagram_result/enneagram_result.dart';
import '../../data/models/enneagram_result/score.dart';
import '../../data/models/question/question.dart';
import '../../get/controller/app_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('설정'),
            ),
            body: buildBody()));
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('앱 버전',
                    style: Get.textTheme.titleMedium,
                    textAlign: TextAlign.left),
                Text('1.0.1', style: Get.textTheme.titleMedium)
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(MyRoute.teamsOfService);
            },
            child: buildListItem('공지사항'),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(MyRoute.teamsOfService);
              },
              child: buildListItem('이용약관 및 정책')),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Flexible(
            flex: 8,
            child: Container(),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                AppController.to.removeUserToken();
              },
              child: const Text('토큰 지우기'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
                onPressed: firebaseTestMethod,
                child: const Text('파이어베이스 테스트 버튼')),
          ),
        ],
      ),
    );
  }

  Padding buildListItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(title,
              style: Get.textTheme.titleMedium, textAlign: TextAlign.left)),
    );
  }

  void firebaseTestMethod() {
    /*
                        // 데이터 삽입

                        final collection = FirebaseFirestore.instance.collection('FirstDemo');
                        collection.add({
                          "name":"name",
                          "description":"abcde"
                        });*/
    // var future = firstDemos.doc(documentId).get();
    // future.then((value) {
    //   value.get(Sec)
    //   print(value.data());
    // });

    CollectionReference firstDemos =
        FirebaseFirestore.instance.collection('FirstDemo');
    String documentId = "nf7KvvmRa6gM59CVnx4";
    firstDemos.doc(documentId).get().then((DocumentSnapshot documentSnapshot) {
      logger.d("DocumentSnapshot documentSnapshot");
      // documentSnapshot.reference.set({
      //   "test" : "test"
      // });
      // documentSnapshot.reference.collection("SecondDemo").add({
      //   "test" : "test"
      // });

      EnneagramResult enneagramResult = EnneagramResult(
          enneagramType: 1,
          questionType: QuestionType.detail135,
          scores: [
            Score(enneagramType: 1, score: 1),
            Score(enneagramType: 2, score: 2),
          ],
          createdAt: DateTime.now());

      logger.d(enneagramResult.toJson());

      final enneagramResultRef = documentSnapshot.reference
          .collection("enneagramResult")
          .withConverter<EnneagramResult>(
              fromFirestore: (snapshot, _) =>
                  EnneagramResult.fromJson(snapshot.data()!),
              toFirestore: (enneagramResult, _) => enneagramResult.toJson());

      enneagramResultRef.add(enneagramResult);
    });

    firstDemos.doc(documentId).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('documentSnapshot.metadata = ${documentSnapshot.metadata}');
        print('documentSnapshot.id = ${documentSnapshot.id}');
        print('documentSnapshot.data() = ${documentSnapshot.data()}');
        print('documentSnapshot.get("name") = ${documentSnapshot.get("name")}');
        print(
            'documentSnapshot.get("description") = ${documentSnapshot.get("description")}');

        CollectionReference secondDemos =
            documentSnapshot.reference.collection("SecondDemo");
        String documentId2 = "51uLfULylLd6JmMxlXAQ";
        secondDemos
            .doc(documentId2)
            .get()
            .then((DocumentSnapshot documentSnapshot2) {
          if (documentSnapshot2.exists) {
            print('documentSnapshot2.metadata = ${documentSnapshot2.metadata}');
            print('documentSnapshot2.data() = ${documentSnapshot2.data()}');
            print(
                'documentSnapshot2.get("name") = ${documentSnapshot2.get("name")}');
            print(
                'documentSnapshot2.get("description") = ${documentSnapshot2.get("description")}');
          }
        });
      }
    });

    /*
                        // 데이터 가져오기
                        firstDemos.get().then((value) {
                          print(value.size);
                          print(value.metadata);
                          print(value.docs);
                          var elementAt = value.docs.elementAt(0).data();
                          print(elementAt);
                        });*/
  }
}
