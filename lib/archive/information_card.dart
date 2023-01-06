import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String name;
  final String meaning;
  final VoidCallback? function;

  const InformationCard(this.name, this.meaning, this.function, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollBarControl = ScrollController();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 26,
                  color: Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (function != null)
                IconButton(
                  onPressed: function,
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
            ],
          ),
          Text(
            'الوصف',
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.left,
              controller: scrollBarControl,
              thickness: 8.0,
              child: ListView(
                controller: scrollBarControl,
                children: [
                  Container(
                    child: Text(
                      meaning,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    padding: const EdgeInsets.all(6.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
