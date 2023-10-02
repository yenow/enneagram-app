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
      fontSize: FontSize(Get.textTheme.bodyLarge!.fontSize!),
      padding: const EdgeInsets.all(1),
      margin: Margins(
          bottom: Margin(0), left: Margin(0), right: Margin(0), top: Margin(0)),
      wordSpacing: 1.0,
      lineHeight: const LineHeight(1.4)),
  "h2": Style(
    fontFamily: 'cafe24SsurroundAir_KR',
    fontSize: FontSize(Get.textTheme.titleLarge!.fontSize!),
    margin: Margins(
        bottom: Margin(0), left: Margin(0), right: Margin(0), top: Margin(0)),
  ),
  "h3": Style(
    fontFamily: 'cafe24SsurroundAir_KR',
    fontSize: FontSize(Get.textTheme.titleMedium!.fontSize!),
    padding: const EdgeInsets.symmetric(vertical: 10),
    margin: Margins(
        bottom: Margin(0), left: Margin(0), right: Margin(0), top: Margin(0)),
  ),
  "h4": Style(
      fontFamily: 'cafe24SsurroundAir_KR',
      fontSize: FontSize(20),
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: Margins(
          bottom: Margin(0),
          left: Margin(0),
          right: Margin(0),
          top: Margin(0))),
  "h5": Style(
    fontFamily: 'cafe24SsurroundAir_KR',
    fontSize: FontSize(18),
    padding: const EdgeInsets.symmetric(vertical: 6),
    margin: Margins(
        bottom: Margin(0), left: Margin(0), right: Margin(0), top: Margin(0)),
  ),
  "h6": Style(
    fontFamily: 'cafe24SsurroundAir_KR',
    fontSize: FontSize(16),
    padding: const EdgeInsets.symmetric(vertical: 4),
    margin: Margins(
        bottom: Margin(0), left: Margin(0), right: Margin(0), top: Margin(0)),
  ),
  "blockquote": Style(),
  "hr": Style(
      height: Height(1.0),
      lineHeight: const LineHeight(1.0),
      margin: Margins(
          bottom: Margin(3),
          left: Margin(0),
          right: Margin(0),
          top: Margin(3))),
  "li": Style(
    fontFamily: 'cafe24SsurroundAir_KR',
    fontSize: FontSize(Get.textTheme.bodyLarge!.fontSize!),
    padding: const EdgeInsets.symmetric(vertical: 2),
    lineHeight: const LineHeight(1.4),
    wordSpacing: 1.0,
  ),
};
