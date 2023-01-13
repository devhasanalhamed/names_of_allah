import 'package:flutter/material.dart';

class InteractiveIcons extends StatelessWidget {
  const InteractiveIcons({
    Key? key,
    required this.clicked,
  }) : super(key: key);

  final bool clicked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: clicked ? 300 : 100),
      height: clicked ? 50 : 0,
      child: clicked
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.copy),
                ),
              ],
            )
          : null,
    );
  }
}
