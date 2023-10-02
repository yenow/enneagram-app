import 'package:enneagram/screens/enneagram_type_description/components/enneagram_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants.dart';
import '../../data/models/enneagram/enneagram.dart';
import '../../get/controller/enneagram_description_controller.dart';

class EnneagramTypeDescriptionScreen extends StatelessWidget {
  final int enneagramType;
  // final tabController = TabController(
  // initialIndex: 0,
  // length: 2,
  // vsync: this,
  // );

  const EnneagramTypeDescriptionScreen({Key? key, required this.enneagramType})
      : super(key: key);

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
          body: buildBody()),
    ));
  }

  TabBar buildTabBar() {
    return const TabBar(
      tabs: <Widget>[
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
      physics: NeverScrollableScrollPhysics(),
      children: [
        buildPage('main'),
        buildPage('good'),
        buildPage('wise_saying'),
        buildPage('wing'),
      ],
    );
  }

  Widget buildPage(String type) {
    return EnneagramWebView(
      url: 'http://168.126.221.239:58000/type$enneagramType/$type.html',
    );
  }
}
