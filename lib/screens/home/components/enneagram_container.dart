import 'package:auto_size_text/auto_size_text.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Shape { vertical, horizontal }

class EnneagramContainer extends StatelessWidget {
  final Shape shape;

  const EnneagramContainer({Key? key, required this.shape}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 8,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            flex: 1,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: AutoSizeText('나의 에니어그램유형은?',
                        maxLines: 1,
                        maxFontSize: 50,
                        minFontSize: 5,
                        style: Get.textTheme.headline5));
              },
            )),
        Flexible(
            flex: 1,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: AutoSizeText('2022-09-20 15:00',
                        maxLines: 1,
                        maxFontSize: 20,
                        minFontSize: 10,
                        style: Get.textTheme.bodySmall));
              },
            )),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 5,
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
        Text('4유형(예술가)',
            style: Get.theme.textTheme.headline6, textAlign: TextAlign.left),
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
                  '표현력이 있고, 극적이며, 자기 내면에 빠져 있으며, 변덕스럽다.',
                  style: Get.textTheme.bodyLarge,
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
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: buildEnneagramHorizontalContainer()),
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
            child: buildEnneagramHorizontalDescription()),
      ],
    );
  }

  Column buildEnneagramHorizontalDescription() {
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
