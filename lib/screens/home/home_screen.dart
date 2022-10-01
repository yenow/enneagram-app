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
import '../../data/models/question.dart';
import '../../data/models/score.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enneagram'),
        ),
        drawer: const CustomDrawer(),
        body: Container(
          color: Colors.black12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Flexible(
                  fit: FlexFit.loose,
                  flex: 10,
                  child: EnneagramContainer(shape: Shape.vertical),
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
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      AppController.to.removeUserToken();
                    },
                    child: Text('토큰 지우기'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                      onPressed: () {
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
                        firstDemos
                            .doc(documentId)
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {
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
                                      EnneagramResult.fromJson(
                                          snapshot.data()!),
                                  toFirestore: (enneagramResult, _) =>
                                      enneagramResult.toJson());

                          enneagramResultRef.add(enneagramResult);
                        });

                        firstDemos
                            .doc(documentId)
                            .get()
                            .then((DocumentSnapshot documentSnapshot) {
                          if (documentSnapshot.exists) {
                            print(
                                'documentSnapshot.metadata = ${documentSnapshot.metadata}');
                            print(
                                'documentSnapshot.id = ${documentSnapshot.id}');
                            print(
                                'documentSnapshot.data() = ${documentSnapshot.data()}');
                            print(
                                'documentSnapshot.get("name") = ${documentSnapshot.get("name")}');
                            print(
                                'documentSnapshot.get("description") = ${documentSnapshot.get("description")}');

                            CollectionReference secondDemos = documentSnapshot
                                .reference
                                .collection("SecondDemo");
                            String documentId2 = "51uLfULylLd6JmMxlXAQ";
                            secondDemos
                                .doc(documentId2)
                                .get()
                                .then((DocumentSnapshot documentSnapshot2) {
                              if (documentSnapshot2.exists) {
                                print(
                                    'documentSnapshot2.metadata = ${documentSnapshot2.metadata}');
                                print(
                                    'documentSnapshot2.data() = ${documentSnapshot2.data()}');
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
                      },
                      child: const Text('파이어베이스 테스트 버튼')),
                ),
                Flexible(flex: 4, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildEnneagramContainer() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(flex: 5, fit: FlexFit.loose, child: buildEnneagramType()),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MyRoute.testSelectScreen);
                  },
                  child: Text('자세히 알아보기')),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Row buildEnneagramType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              "assets/images/enneagram/cat.png",
              // height: 70,
              // width: 70,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: buildEnneagramTypeDescription()),
      ],
    );
  }

  Column buildEnneagramTypeDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text('4유형',
            style: Get.theme.textTheme.headline6, textAlign: TextAlign.left),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: LayoutBuilder(builder: (context, constraints) {
            print('maxHeight : ${constraints.maxHeight}');
            print('maxWidth : ${constraints.maxWidth}');

            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: const AutoSizeText(
                '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.',
                maxLines: 2,
              ),
            );
          }),
        ),
      ],
    );
  }
}
