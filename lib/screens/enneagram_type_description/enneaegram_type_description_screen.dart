import 'package:flutter/material.dart';

class EnneagramTypeDescriptionScreen extends StatelessWidget {
  final int enneagramType;

  const EnneagramTypeDescriptionScreen({Key? key, required this.enneagramType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('$enneagramType유형'),
      ),
        body: Container()));
  }
}
