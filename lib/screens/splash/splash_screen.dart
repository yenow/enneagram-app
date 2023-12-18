import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../get/controller/app_controller.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
        splash: Column(
          children: [
            Icon(Icons.home, size: Get.textTheme.headlineMedium?.fontSize),
            Text(
              '에니어그램',
              style: Get.textTheme.headlineMedium,
            ),
          ],
        ),
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Get.theme.colorScheme.background,
        screenFunction: () async {
          await _processingData();

          return const HomeScreen();
        });
  }

  // 데이터 조회 및 초기화 작업
  Future<void> _processingData() async {
    await AppController.to.initData();
  }
}
