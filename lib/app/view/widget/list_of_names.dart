import 'dart:io';

import 'package:flutter/material.dart';
import 'package:names_of_allah/app/logic/data_provider.dart';
import 'package:names_of_allah/app/data/models/name_model.dart';
import 'package:names_of_allah/app/view/widget/share_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'interactive_icons.dart';

class ListOfNames extends StatefulWidget {
  final List<NameModel> names;
  const ListOfNames(this.names, {super.key});

  @override
  State<ListOfNames> createState() => _ListOfNamesState();
}

class _ListOfNamesState extends State<ListOfNames> {
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
  bool expanded = false;
  bool showContent = false;

  void shareIt(NameModel name) async {
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
        bottom: name.id == widget.lastItem ? 85 : 10,
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          setState(
            () => expanded = !expanded,
          );
        },
        child: AnimatedSize(
          duration: const Duration(milliseconds: 350),
          alignment: Alignment.topCenter,
          reverseDuration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
          onEnd: () => showContent = !showContent,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.95),
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
                if (expanded)
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
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
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
                if (expanded)
                  InteractiveIcons(
                    name: name.name,
                    meaning: name.meaning,
                    favorite: false,
                    shareIt: () => shareIt(name),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
