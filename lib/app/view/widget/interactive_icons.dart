import 'package:flutter/material.dart';
import 'package:names_of_allah/app/logic/data_provider.dart';
import 'package:provider/provider.dart';

class InteractiveIcons extends StatelessWidget {
  const InteractiveIcons({
    super.key,
    required this.name,
    required this.meaning,
    required this.favorite,
    required this.shareIt,
  });

  final String name;
  final String meaning;
  final bool favorite;
  final VoidCallback shareIt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
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
              Provider.of<DataProvider>(context, listen: false).showSnackBar(
                context,
                favorite ? 'إزالة من المفضلة' : 'إضافة إلى المفضلة',
              );
            },
            icon: favorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            color: Colors.red,
          ),
          IconButton(
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false)
                  .copyToClipboard(context, name, meaning);
            },
            icon: const Icon(Icons.copy),
          ),
        ],
      ),
    );
  }
}
