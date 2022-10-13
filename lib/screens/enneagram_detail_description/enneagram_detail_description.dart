
import 'package:enneagram/data/models/enneagram/enneagram.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../constants.dart';
import '../../get/controller/enneagram_description_controller.dart';
import 'components/barchart_sample.dart';

class EnneagramDetailDescription extends StatelessWidget {
  final int enneagramType;
  const EnneagramDetailDescription({Key? key, required this.enneagramType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 4,
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
        buildPage('basic'),
        buildPage('etc1'),
        buildPage('etc2'),
        buildPage('wings'),
      ],
    );
  }

  Widget buildPage(String type) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Container(),
        // child: Html(
        //   shrinkWrap: true,
        //   data: EnneagramDescriptionController.to.enneagramDescription.value.enneagramTypeDescription![enneagramType]![type],
        //   style: htmlStyleMap,
        // ),
      ),
    );
  }

  Widget buildAnalysisPage() {
    return ListView(
      children: [
        SizedBox(
          height: 400,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BarChartSample1(),
            )),
      ],
    );
  }
}
