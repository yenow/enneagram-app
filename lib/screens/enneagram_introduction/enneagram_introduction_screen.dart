import 'package:auto_size_text/auto_size_text.dart';
import 'package:enneagram/route.dart';
import 'package:enneagram/screens/enneagram_type_description/components/enneagram_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../get/controller/enneagram_description_controller.dart';

class EnneagramIntroductionScreen extends StatelessWidget {
  const EnneagramIntroductionScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const AutoSizeText(
        '에니어그램 소개',
      ),
    );
  }

  Widget buildBody() {
    return const EnneagramWebView(url: 'http://168.126.221.239:58000/enneagram_introduce.html');
  }

  // Padding buildBody() {
  //   return Padding(
  //     padding: const EdgeInsets.all(15.0),
  //     child: SingleChildScrollView(
  //       child: Html(
  //         shrinkWrap: true,
  //         data: EnneagramDescriptionController.to.enneagramDescription.value.enneagramIntroduction,
  //         style: htmlStyleMap,
  //       ),
  //     ),
  //   );
  // }
}
