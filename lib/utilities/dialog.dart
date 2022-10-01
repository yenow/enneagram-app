import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> alertDialog(String content) async {
  await Get.dialog(AlertDialog(
    title: Text(
      '알림',
      style: Get.textTheme.subtitle1,
    ),
    content: Text(
      content,
      style: Get.textTheme.bodyText1,
    ),
    actions: [
      TextButton(
        child: Text("닫기", style: Get.textTheme.bodyText1),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  ));
}
