import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> alertDialog(String content) async {
  await Get.dialog(AlertDialog(
    title: Text(
      '알림',
      style: Get.textTheme.titleMedium,
    ),
    content: Text(
      content,
      style: Get.textTheme.bodyLarge,
    ),
    actions: [
      TextButton(
        child: Text("닫기", style: Get.textTheme.bodyLarge),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  ));
}
