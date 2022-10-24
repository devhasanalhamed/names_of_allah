import 'package:flutter/material.dart';
import 'package:names_of_allah/models/names.dart';

class ListOfNames extends StatelessWidget {
  final List<Names> names;
  final Function function;
  const ListOfNames(
      this.names,
      this.function,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(top: 15.0),
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (ctx, index){
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10,
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25)
                    ),
                    onTap: () => function(names[index].name,names[index].meaning),
                    child: Center(
                      child: Text(
                        names[index].name.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
