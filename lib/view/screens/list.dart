import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.7,
                color: Colors.amber,
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.3,
                color: Colors.black,
              )
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                width: 300,
                height: 200,
                color: Colors.white,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: 300,
                      height: 100,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
