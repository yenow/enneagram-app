import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

final DateFormat dateFormatter = DateFormat('yyyy-MM-dd hh:mm');

Map<String, Style> htmlStyleMap = {
  "p": Style(
      fontFamily: 'cafe24SsurroundAir_KR',
      fontSize: FontSize(Get.textTheme.bodyText1!.fontSize!),
      padding: const EdgeInsets.all(1),
      wordSpacing: 1.0,
    lineHeight: const LineHeight(1.4)
  ),
  "h2": Style(
      fontFamily: 'cafe24SsurroundAir_KR',
      fontSize: FontSize(Get.textTheme.headline5!.fontSize!)),
  "h3": Style(
      fontFamily: 'cafe24SsurroundAir_KR',
      fontSize: FontSize(Get.textTheme.headline6!.fontSize!)),
  "li": Style(
    fontFamily: 'cafe24SsurroundAir_KR',
    padding: const EdgeInsets.symmetric(vertical: 2),
  ),
};
