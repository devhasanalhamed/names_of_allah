import 'package:flutter/material.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';
import 'package:provider/provider.dart';

class InteractiveIcons extends StatelessWidget {
  const InteractiveIcons({
    Key? key,
    required this.clicked,
    required this.name,
    required this.meaning,
    required this.favorite,
    required this.shareIt,
  }) : super(key: key);

  final bool clicked;
  final String name;
  final String meaning;
  final bool favorite;
  final VoidCallback shareIt;

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
                  onPressed: shareIt,
                  icon: const Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<DataProvider>(context, listen: false)
                        .addFavorite(name);
                  },
                  icon: favorite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  color: Colors.red,
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
