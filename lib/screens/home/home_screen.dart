import 'package:enneagram/get/controller/app_controller.dart';
import 'package:enneagram/route.dart';
import 'package:enneagram/screens/home/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../data/models/enneagram/enneagram.dart';
import 'components/my_enneagram_container.dart';

final Future<String> calculation = Future<String>.delayed(
  Duration(seconds: 2),
  () => 'Y',
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => buildBody(),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '에니어그램',
          ),
        ),
        drawer: CustomDrawer(enneagramType: AppController.to.user.value.enneagramResult!.enneagramType),
        body: mainContent(),
      ),
    );
  }

  // 메인
  Container mainContent() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyEnneagramContainer(
              enneagramType: AppController.to.user.value.enneagramResult!.enneagramType,
              // wingType: AppController.to.user.value.enneagramResult!.findWingType(),
            ),
            Container(
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 1 개의 행에 보여줄 item 개수
                  childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
                ),
                itemBuilder: (context, index) {
                  return EnneagramItem(index);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.enneagramIntroduction);
                },
                child: const Text('에니어그램이란?'),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.testSelectScreen);
                },
                child: const Text('에니어그램 테스트'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 에니어그램 유형별 아이콘
  Widget EnneagramItem(int index) {
    index = (index) % 9 + 1; // 10 > index > 0

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.enneagramTypeDescription, arguments: index);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              enneagramMap[index]!.imageUrl,
              fit: BoxFit.fitHeight,
              height: 60.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              enneagramMap[index]!.getName(),
              style: Get.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
