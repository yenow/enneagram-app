import 'package:auto_size_text/auto_size_text.dart';
import 'package:enneagram/common/components/block_text.dart';
import 'package:enneagram/data/models/enneagram/enneagram.dart';
import 'package:enneagram/data/models/enneagram_result/enneagram_result.dart';
import 'package:enneagram/get/controller/app_controller.dart';
import 'package:enneagram/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/user/user.dart';
import '../../../main.dart';
import 'date_drop_down.dart';

enum Shape { vertical, horizontal }

class MyEnneagramContainer extends StatelessWidget {
  final int enneagramType;
  final int? wingType;

  const MyEnneagramContainer({Key? key, required this.enneagramType, this.wingType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppController.to.user.value.enneagramResult!.enneagramType == 0 ? noEnneagramContainer() : myEnneagramContainer();
  }

  Container noEnneagramContainer() => Container(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: AutoSizeText(
          '에니어그램 9가지 유형',
          style: Get.textTheme.titleMedium,
          maxLines: 1,
        ),
      );

  Container myEnneagramContainer() {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          titleContainer(),
          buildDateDropDown(),
          Expanded(
            child: EnneagramContainer(),
          ),
        ],
      ),
    );
  }

  Container titleContainer() {
    return Container(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: AutoSizeText(
        '나의 에니어그램',
        style: Get.textTheme.titleMedium,
        maxLines: 1,
      ),
    );
  }

  Row EnneagramContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// 나의 에니어그램 이미지
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h),
          child: Image.asset(
            height: 50.h,
            width: 50.w,
            alignment: Alignment.topCenter,
            enneagramMap[enneagramType]!.imageUrl!,
          ),
        ),
        Expanded(
          child: buildEnneagramHorizontalDescription(),
        ),
        Container(
          width: 70.w,
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 20.h),
          child: ElevatedButton(
            child: const Text('자세히'),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  /// 에니어그램 설명
  Widget buildEnneagramHorizontalDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          alignment: Alignment.centerLeft,
          child: Text(
            enneagramMap[enneagramType]!.getName(),
            style: Get.theme.textTheme.titleSmall,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              maxLines: 2,
              enneagramMap[enneagramType]!.secondDescription,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateDropDown() {
    return Container(
      height: 30,
      child: DateDropDown(
        list: AppController.to.user.value.enneagramResults.map((e) => dateFormatter.format(e.createdAt)).toList(),
        callback: (String date) {
          EnneagramResult enneagramResult =
              AppController.to.user.value.enneagramResults.where((element) => date == dateFormatter.format(element.createdAt)).first;

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
}
