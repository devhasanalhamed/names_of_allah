import 'dart:math';

import 'package:flutter/material.dart';

class ShareWidget extends StatefulWidget {
  final String name;
  final String meaning;
  const ShareWidget(this.name, this.meaning, {Key? key}) : super(key: key);

  @override
  _ShareWidgetState createState() => _ShareWidgetState();
}

class _ShareWidgetState extends State<ShareWidget> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        height: max((widget.name.length / 10) * 15, 250),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF192837),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: const Color(0xFF192837),
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
                    widget.name,
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFF289BAF),
                    ),
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
                  color: const Color(0xFF289BAF).withOpacity(0.1),
                ),
                child: ListView(
                  children: [
                    Text(
                      widget.meaning,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text('تمت مشاركته عبر تطبيق حُسنى 💖'),
          ],
        ),
      ),
    );
  }
}
