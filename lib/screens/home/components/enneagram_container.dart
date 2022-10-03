import 'package:auto_size_text/auto_size_text.dart';
import 'package:enneagram/data/models/enneagram/enneagram.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/get/controller/app_controller.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/user/user.dart';
import '../../../main.dart';
import 'date_drop_down.dart';

enum Shape { vertical, horizontal }

class EnneagramContainer extends StatelessWidget {
  final Shape shape;
  final int enneagramType;

  const EnneagramContainer(
      {Key? key, required this.shape, required this.enneagramType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shape == Shape.vertical) {
      return buildVerticalContainer();
    } else {
      return buildHorizontalContainer();
    }
  }

  Container buildVerticalContainer() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 12,
              fit: FlexFit.loose,
              child: buildEnneagramVerticalContainer()),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
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

  Column buildEnneagramVerticalContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            flex: 2,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: AutoSizeText('나의 에니어그램유형은?',
                        maxLines: 1,
                        maxFontSize: 50,
                        minFontSize: 5,
                        style: Get.textTheme.headline6));
              },
            )),
        Flexible(
            flex: 1,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: DateDropDown(
                      list: AppController.to.user.value.enneagramResults.map((e) => dateFormatter.format(e.createdAt)).toList(),
                      callback: (String date) {
                        logger.d('click date = $date');
                        EnneagramResult enneagramResult = AppController.to.user.value.enneagramResults.where((element) => date == dateFormatter.format(element.createdAt)).first;
                        User newUser = User(
                            userToken: AppController.to.user.value.userToken,
                            createdAt: AppController.to.user.value.createdAt,
                            enneagramResults: AppController.to.user.value.enneagramResults,
                            enneagramResult: enneagramResult);
                        AppController.to.user(newUser);
                      },
                    )
                );
              },
            )),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              enneagramMap[enneagramType]!.imageUrl!,
              // height: 70,
              // width: 70,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: buildEnneagramVerticalDescription()),
      ],
    );
  }

  Widget buildEnneagramVerticalDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(enneagramMap[enneagramType]!.getName(),
            style: Get.theme.textTheme.subtitle2, textAlign: TextAlign.left),
        const SizedBox(
          height: 5,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: LayoutBuilder(builder: (context, constraints) {
            // print('maxHeight : ${constraints.maxHeight}');??
            // print('maxWidth : ${constraints.maxWidth}');

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: AutoSizeText(
                  enneagramMap[enneagramType]!.secondDescription,
                  style: Get.textTheme.bodyText2,
                  maxLines: 2,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Container buildHorizontalContainer() {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.grey, width: 1),
      //     borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: buildEnneagramHorizontalContainer()),
          const SizedBox(
            height: 5,
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MyRoute.testSelectScreen);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)
                  ),
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

  Row buildEnneagramHorizontalContainer() {
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
              enneagramMap[enneagramType]!.imageUrl!,
              // height: 70,
              // width: 70,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: buildEnneagramHorizontalDescription()),
      ],
    );
  }

  Widget buildEnneagramHorizontalDescription() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(enneagramMap[enneagramType]!.getName(),
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
                child: AutoSizeText(
                  enneagramMap[enneagramType]!.secondDescription,
                  maxLines: 2,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
