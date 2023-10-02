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
    return AppController.to.user.value.enneagramResult!.enneagramType == 0 ? Container() : myEnneagram();
  }

  Container myEnneagram() {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // 타이틀
          Container(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
            child: AutoSizeText(
              '나의 에니어그램',
              style: Get.textTheme.titleMedium,
              maxLines: 1,
            ),
          ),
          // 나의 에니어그램
          Expanded(
            child: EnneagramContainer(),
          ),
        ],
      ),
    );
  }

  Row EnneagramContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// 나의 에니어그램 이미지
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Image.asset(
            enneagramMap[enneagramType]!.imageUrl!,
            height: 50.h,
            width: 50.h,
            alignment: Alignment.topCenter,
          ),
        ),
        Expanded(
          child: buildEnneagramHorizontalDescription(),
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
          padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
          alignment: Alignment.centerLeft,
          child: Text(
            enneagramMap[enneagramType]!.getName(),
            style: Get.theme.textTheme.titleSmall,
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: AutoSizeText(
            enneagramMap[enneagramType]!.secondDescription,
            maxLines: 2,
          ),
        )
      ],
    );
  }

  Widget buildDateDropDown() {
    return Container(
      height: 30,
      child: DateDropDown(
        list: AppController.to.user.value.enneagramResults.map((e) => dateFormatter.format(e.createdAt)).toList(),
        callback: (String date) {
          logger.d('click date = $date');
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
