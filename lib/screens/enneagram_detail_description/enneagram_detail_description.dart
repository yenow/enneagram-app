
import 'package:enneagram/data/models/enneagram/enneagram.dart';
import 'package:enneagram/get/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../enneagram_type_description/components/enneagram_webview.dart';
import 'components/enneagram_chart.dart';

class EnneagramDetailDescription extends StatelessWidget {
  final int enneagramType;
  const EnneagramDetailDescription({Key? key, required this.enneagramType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
              appBar: AppBar(
                title: Text(enneagramMap[enneagramType]!.getName()),
                bottom: buildTabBar(),
              ),
              body: buildBody()
          ),
        )
    );
  }

  TabBar buildTabBar() {
    return const TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.assessment_outlined),
        ),
         Tab(
          icon: Icon(Icons.home),
        ),
        Tab(
          icon: Icon(Icons.article),
        ),
        Tab(
          icon: Icon(Icons.people),
        ),
        Tab(
          icon: Icon(Icons.air),
        ),
      ],
    );
  }

  Widget buildBody() {
    return TabBarView(
      children: [
        buildAnalysisPage(),
        buildPage('main'),
        buildPage('good'),
        buildPage('wise_saying'),
        buildPage('wing'),
      ],
    );
  }

  Widget buildAnalysisPage() {
    return Column(
      children: [
        // SizedBox(height: 10,),
        // Text('내 유형별 점수는..?',style: Get.textTheme.headline5),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: EnneagramChart(
                title: '내 유형별 점수는?',
                scoreMap: AppController.to.user.value.enneagramResult!
                    .findEnneagramScoreSumMap(),
                maxScore: AppController.to.user.value.enneagramResult!
                    .returnMaxScore()),
          ),
        ),
        Flexible(
          flex: 1,
            child: Container()
        )
        // Flexible(
        //   flex: 2,
        //   child: Column(
        //     children: [
        //       Text('가장 점수가 높은 유형 : ${AppController.to.user.value.enneagramResult!.findHighestEnneagramType()}유형', style: Get.textTheme.headline6,),
        //       Text('가장 점수가 낮은 유형 : ${AppController.to.user.value.enneagramResult!.findLowestEnneagramType()}유형', style: Get.textTheme.headline6,),
        //       Text('날개 유형 : ${AppController.to.user.value.enneagramResult!.findWingType()}유형', style: Get.textTheme.headline6,),
        //     ],
        //   )
        // )
      ],
    );
  }

  Widget buildPage(String type) {
    return EnneagramWebView(
      url: 'http://ysy.dothome.co.kr/type$enneagramType/$type.html',
    );
  }
}
