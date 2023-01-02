import 'package:flutter/material.dart';
import 'package:names_of_allah/models/names.dart';

class ListOfNames extends StatelessWidget {
  final List<Names> names;
  final Function function;
  const ListOfNames(this.names, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
              // topRight: Radius.circular(15),
              // topLeft: Radius.circular(15),
              ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    onTap: () =>
                        function(names[index].name, names[index].meaning),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Image.asset('assets/images/name_holder.png'),
                            Text(
                              names[index].name.toString(),
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}