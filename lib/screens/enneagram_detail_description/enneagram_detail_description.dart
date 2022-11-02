
import 'package:enneagram/data/models/enneagram/enneagram.dart';
import 'package:enneagram/get/controller/app_controller.dart';
import 'package:flutter/material.dart';

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
    return ListView(
      children: [
        SizedBox(
          height: 400,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: EnneagramChart(
                  scoreMap: AppController.to.user.value.enneagramResult!
                      .returnEnneagramTypeScoreSumMap(),
                  maxScore: AppController.to.user.value.enneagramResult!
                      .returnMaxScore()),
            )),
      ],
    );
  }

  Widget buildPage(String type) {
    return EnneagramWebView(
      url: 'http://ysy.dothome.co.kr/type$enneagramType/$type.html',
    );
  }
}
