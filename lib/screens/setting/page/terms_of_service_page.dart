import 'package:flutter/material.dart';

class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
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
      title: const Text('이용약관 및 정책'),
    );
  }

  Container buildBody() => Container();
}
