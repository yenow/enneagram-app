import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../constants.dart';
import '../../data/models/enneagram/enneagram.dart';
import '../../get/controller/enneagram_description_controller.dart';

class EnneagramTypeDescriptionScreen extends StatelessWidget {
  final int enneagramType;

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
          body: buildBody()
        ),
      )
    );
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
      children: [
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
        child: Html(
          shrinkWrap: true,
          data: EnneagramDescriptionController.to.enneagramDescription.value.enneagramTypeDescription![enneagramType]![type],
          style: htmlStyleMap,
        ),
      ),
    );
  }
}
