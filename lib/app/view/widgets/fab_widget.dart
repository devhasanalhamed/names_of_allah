import 'package:flutter/material.dart';
import 'dart:math';

const buttonSize = 60.0;

class MyFABWidget extends StatefulWidget {
  const MyFABWidget({Key? key}) : super(key: key);

  @override
  State<MyFABWidget> createState() => _MyFABWidgetState();
}

class _MyFABWidgetState extends State<MyFABWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(),
      children: <IconData>[
        Icons.question_answer,
        Icons.question_answer,
      ].map<Widget>(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData icon) => SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: FloatingActionButton(
          elevation: 0.0,
          child: Icon(
            icon,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.width - buttonSize;
    context.paintChild(
      0,
      // transform: Matrix4.identity()..translate(0, -200, 0),
    );
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
