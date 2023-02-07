import 'package:flutter/material.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';
import 'dart:math';

import 'package:provider/provider.dart';

//todo need to fix
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
    controller = AnimationController(
      duration: const Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(animationController: controller),
      children: <IconData>[
        Icons.menu,
        Icons.question_mark,
        Icons.favorite,
      ].map<Widget>(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData icon) {
    var toggleFavorite = false;
    return SizedBox(
      width: buttonSize,
      height: buttonSize,
      child: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.white,
        ),
        onPressed: () {
          if (icon == Icons.menu) {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          }
          if (icon == Icons.favorite) {
            toggleFavorite = !toggleFavorite;
            Provider.of<DataProvider>(context, listen: false)
                .toggleFavoriteList();
            controller.reverse();
          }
          if (icon == Icons.question_mark) {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('أسماء الله الحُسنى'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('تم تطويره من قبل:',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl),
                          Text(
                            'أحمد العمودي',
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            'Ahmed@amoudi',
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            'حسن الحامد',
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            'hassan@hamed',
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('إغلاق'),
                      )
                    ],
                  ),
                ),
              ),
            );
            controller.reverse();
          }
        },
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final AnimationController animationController;

  FlowMenuDelegate({required this.animationController})
      : super(repaint: animationController);
  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    const xStart = buttonSize;
    final yStart = size.height - buttonSize;
    final n = context.childCount;
    const margin = 5;
    if (animationController.status == AnimationStatus.forward ||
        animationController.status == AnimationStatus.reverse ||
        animationController.status == AnimationStatus.completed) {
      for (int i = 0; i < n; i++) {
        final x = xStart - buttonSize;
        final dx = (buttonSize + margin) * i;
        final y = yStart - dx * animationController.value;
        context.paintChild(
          i,
          transform: Matrix4.translationValues(x, y, 0),
        );
      }
      ;
    } else {
      final x = xStart - buttonSize;
      final y = yStart;
      context.paintChild(
        0,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
