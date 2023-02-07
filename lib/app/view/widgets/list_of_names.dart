import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';
import 'package:names_of_allah/app/models/names.dart';
import 'package:provider/provider.dart';

import 'interactive_icons.dart';

class ListOfNames extends StatefulWidget {
  const ListOfNames(this.names, this.function, {Key? key}) : super(key: key);

  final Function function;
  final List<Names> names;

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
            widget.names[index].name,
            widget.names[index].meaning,
            index,
            widget.names[index].favorite,
            widget.names[index].open,
          );
        },
      ),
    );
  }
}

class NamesHolder extends StatefulWidget {
  final String name;
  final String meaning;
  final int index;
  final bool favorite;
  final bool open;
  const NamesHolder(
      this.name, this.meaning, this.index, this.favorite, this.open,
      {Key? key})
      : super(key: key);

  @override
  State<NamesHolder> createState() => _NamesHolder();
}

class _NamesHolder extends State<NamesHolder> {
  var clicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: clicked ? 500 : 100),
        width: double.infinity,
        height: widget.open ? 250 : 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: widget.open
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.secondary.withOpacity(0.95),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          onTap: () {
            Provider.of<DataProvider>(context, listen: false)
                .nameSelecter(widget.name);

            setState(() {
              clicked = !clicked;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 24,
                        // fontFamily: 'Solo',
                      ),
                    ),
                    // SizedBox(
                    //   height: 50,
                    //   width: 110,
                    //   child: SvgPicture.asset(
                    //     'assets/images/Asset.svg',
                    //     color: Theme.of(context).colorScheme.primary,
                    //     semanticsLabel: 'islamic',
                    //   ),
                    // ),
                  ],
                ),
                if (widget.open)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(5),
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
                            widget.meaning,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                InteractiveIcons(
                  clicked: widget.open,
                  name: widget.name,
                  meaning: widget.meaning,
                  favorite: widget.favorite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
