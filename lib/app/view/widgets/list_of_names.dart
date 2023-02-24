import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';
import 'package:names_of_allah/app/models/names.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'interactive_icons.dart';

class ListOfNames extends StatefulWidget {
  final List<Names> names;
  const ListOfNames(this.names, {Key? key}) : super(key: key);

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
          return NamesHolder(
            index,
            key: UniqueKey(),
          );
        },
      ),
    );
  }
}

class NamesHolder extends StatefulWidget {
  final int index;
  const NamesHolder(this.index, {Key? key}) : super(key: key);

  @override
  State<NamesHolder> createState() => _NamesHolder();
}

class _NamesHolder extends State<NamesHolder> {
  final ScreenshotController _screenshotController = ScreenshotController();
  late Uint8List _imageFile;

  void shareIt(Names name) async {
    final imageFile = await _screenshotController.captureFromWidget(
      Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'NotoKufiArabic',
                      ),
                    ),
                    Container(
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ),
                  child: ListView(
                    children: [
                      Text(
                        name.meaning,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Text('تمت مشاركته عبر تطبيق حُسنى 💖'),
            ],
          ),
        ),
      ),
    );
    final directory = await getApplicationSupportDirectory();
    final imagePath = File('${directory.path}/images.png');
    await imagePath.writeAsBytes(imageFile);
    Share.shareXFiles([XFile(imagePath.path)]);
  }

  @override
  Widget build(BuildContext context) {
    final _name = Provider.of<DataProvider>(context).returnName(widget.index);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Screenshot(
        controller: _screenshotController,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: double.infinity,
          height: _name.open ? 250 : 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: _name.open
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.secondary.withOpacity(0.95),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {
              Provider.of<DataProvider>(context, listen: false)
                  .nameSelecter(widget.index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _name.name,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          '${widget.index + 1}',
                          style: const TextStyle(color: Colors.white),
                        )),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                if (_name.open)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                      ),
                      child: ListView(
                        children: [
                          Text(
                            _name.meaning,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                InteractiveIcons(
                  clicked: _name.open,
                  name: _name.name,
                  meaning: _name.meaning,
                  favorite: _name.favorite,
                  shareIt: () => shareIt(_name),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
