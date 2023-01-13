import 'package:flutter/material.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';

class InteractiveIcons extends StatelessWidget {
  const InteractiveIcons({
    Key? key,
    required this.clicked,
    required this.name,
    required this.meaning,
  }) : super(key: key);

  final bool clicked;
  final String name;
  final String meaning;

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
                  onPressed: () {
                    DataProvider().copyToClipboard(context, name, meaning);
                  },
                  icon: const Icon(Icons.copy),
                ),
              ],
            )
          : null,
    );
  }
}
