import 'package:flutter/material.dart';
import 'package:names_of_allah/models/names.dart';

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
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              // topRight: Radius.circular(15),
              // topLeft: Radius.circular(15),
              ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView.builder(
            itemCount: widget.names.length,
            itemBuilder: (ctx, index) {
              return NamesHolder(
                  widget.names[index].name, widget.names[index].meaning);
            }),
      ),
    );
  }
}

class NamesHolder extends StatefulWidget {
  final String name;
  final String meaning;
  const NamesHolder(this.name, this.meaning, {Key? key}) : super(key: key);

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
        height: clicked ? 250 : 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          onTap: () {
            setState(() {
              clicked = !clicked;
            });
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  if (clicked)
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
                              .background
                              .withOpacity(0.5),
                        ),
                        child: ListView(
                          children: [
                            Text(
                              widget.meaning,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: clicked ? 300 : 100),
                    height: clicked ? 50 : 0,
                    child: clicked
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.share,
                              ),
                              Icon(
                                Icons.favorite,
                              ),
                              Icon(
                                Icons.copy,
                              ),
                            ],
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
