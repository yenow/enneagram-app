import 'package:auto_size_text/auto_size_text.dart';
import 'package:enneagram/common/components/block_text.dart';
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
  final int? wingType;

  const EnneagramContainer(
      {Key? key, required this.shape, required this.enneagramType, this.wingType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shape == Shape.vertical) {
      return AppController.to.user.value.enneagramResult!.enneagramType == 0
          ? buildNoTypeVerticalContainer()
          : buildVerticalContainer();
    } else {
      return AppController.to.user.value.enneagramResult!.enneagramType == 0
          ? buildNoTypeHorizontalContainer()
          : buildHorizontalContainer();
    }
  }

  /// 에니어그램 타입이 없을때
  Widget buildNoTypeVerticalContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Center(
                  child: Text(
                '나의 에니어그램은?',
                style: Get.theme.textTheme.headline5,
              )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/enneagram/pawprint.png',
                ),
              ),
              Center(
                  child: Text(
                '테스트를 진행해주세요!',
                style: Get.theme.textTheme.subtitle1,
              ))
            ],
          ),
        ],
      ),
    );
  }

  /// 에니어그램 타입이 없을때
  Widget buildNoTypeHorizontalContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/enneagram/pawprint.png',
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(child: Text('나의 에니어그램은?', style: Get.theme.textTheme.subtitle1,)),
                // const SizedBox(height: 20,),
                Center(
                    child: Text(
                  '테스트를 진행해주세요!',
                  style: Get.theme.textTheme.bodyText1,
                ))
              ],
            ),
          ),
        ],
      ),
    );
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
              flex: 11,
              fit: FlexFit.loose,
              child: buildEnneagramVerticalContainer()),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(MyRoute.enneagramDetailDescription,
                        arguments: enneagramType);
                  },
                  child: const Text('자세히 알아보기')),
            ),
          ),
          const SizedBox(
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
            flex: 3,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: AutoSizeText('나의 에니어그램유형은?',
                        maxLines: 1,
                        maxFontSize: 50,
                        minFontSize: 5,
                        style: Get.textTheme.headline4));
              },
            )),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (AppController.to.user.value.enneagramResults.isEmpty) {
                  return Container();
                }
                return buildDateDropDown();
              },
            )),
        const SizedBox(
          width: 10,
        ),
        // 에니어그램 이미지
        Flexible(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              enneagramMap[enneagramType]!.imageUrl,
              // height: 70,
              // width: 70,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // 애니어그램 설명
        Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: buildEnneagramVerticalDescription()),
      ],
    );
  }

  Widget buildDateDropDown() {
    return Align(
      alignment: Alignment.topCenter,
      child: DateDropDown(
        list: AppController.to.user.value.enneagramResults
            .map((e) => dateFormatter.format(e.createdAt))
            .toList(),
        callback: (String date) {
          logger.d('click date = $date');
          EnneagramResult enneagramResult = AppController
              .to.user.value.enneagramResults
              .where((element) =>
                  date == dateFormatter.format(element.createdAt))
              .first;
          User newUser = User(
              userToken: AppController.to.user.value.userToken,
              createdAt: AppController.to.user.value.createdAt,
              enneagramResults: AppController.to.user.value.enneagramResults,
              enneagramResult: enneagramResult);
          AppController.to.user(newUser);
        },
      ),
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
            style: Get.theme.textTheme.headline6, textAlign: TextAlign.left),
        const SizedBox(
          height: 5,
        ),
        wingType != null
            ? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Block(
                  child: Text('날개유형 : $wingType유형',
                      style: Get.theme.textTheme.bodyText1)),
            )
            : Container(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AutoSizeText(
            enneagramMap[enneagramType]!.secondDescription,
            style: Get.textTheme.bodyText1,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget buildHorizontalContainer() {
    return Column(
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
                    backgroundColor: MaterialStateProperty.all(
                        Get.theme.colorScheme.primary)),
                child: Text('${enneagramMap[enneagramType]!.getName()} 알아보기')),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
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
