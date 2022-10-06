
import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Widget child;
  const Block({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        // border: Border.all(width: 1),
        color: Colors.grey.shade400
      ),
      child: child,
    );
  }
}
