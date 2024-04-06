import 'dart:io';

import 'package:flutter/material.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';
import 'package:names_of_allah/app/models/names.dart';
import 'package:names_of_allah/app/view/widgets/share_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'interactive_icons.dart';

class ListOfNames extends StatefulWidget {
  final List<Names> names;
  const ListOfNames(this.names, {super.key});

  @override
  State<ListOfNames> createState() => _ListOfNamesState();
}

class _ListOfNamesState extends State<ListOfNames> {
  var clicked = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.names.length,
        itemBuilder: (ctx, index) {
          return NameCard(
            index,
            widget.names.length,
            key: UniqueKey(),
          );
        },
      ),
    );
  }
}

class NameCard extends StatefulWidget {
  final int index;
  final int lastItem;
  const NameCard(this.index, this.lastItem, {super.key});

  @override
  State<NameCard> createState() => _NameCard();
}

class _NameCard extends State<NameCard> {
  final ScreenshotController _screenshotController = ScreenshotController();
  bool selected = false;

  void shareIt(Names name) async {
    Provider.of<DataProvider>(context, listen: false)
        .showSnackBar(context, 'المشاركة من خلال');
    final imageFile = await _screenshotController
        .captureFromWidget(ShareWidget(name.name, name.meaning));
    final directory = await getApplicationSupportDirectory();
    final imagePath = File('${directory.path}/images.png');
    await imagePath.writeAsBytes(imageFile);
    Share.shareXFiles([XFile(imagePath.path)]);
  }

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<DataProvider>(context).returnName(widget.index);
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        // Extra bottom to ensure not the last name not hided by floating action button
        bottom: name.id == widget.lastItem ? 75 : 10,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          setState(
            () => selected = !selected,
          );
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          duration: Duration(milliseconds: selected ? 400 : 250),
          constraints: const BoxConstraints(minHeight: 60, maxHeight: 5000),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: name.open
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.secondary.withOpacity(0.95),
          ),
          child: ListView(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name.name,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                        child: Text(
                      '${name.id}',
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              if (selected)
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        name.meaning,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              if (selected)
                InteractiveIcons(
                  name: name.name,
                  meaning: name.meaning,
                  favorite: name.favorite,
                  shareIt: () => shareIt(name),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
