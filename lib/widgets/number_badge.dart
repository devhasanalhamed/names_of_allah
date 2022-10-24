import 'package:flutter/material.dart';


class NumberBadge extends StatelessWidget {
  final String num;
  const NumberBadge(
      this.num,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      child: Center(
        child: Text(
          num,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
