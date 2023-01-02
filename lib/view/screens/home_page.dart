//TODO upgrades to the design

import 'package:flutter/material.dart';
import 'package:names_of_allah/providers/namesProvider.dart';
import 'package:names_of_allah/theme/theme_manager.dart';
import 'package:names_of_allah/view/widgets/appbar.dart';
import 'package:names_of_allah/view/widgets/information_card.dart';
import 'package:names_of_allah/view/widgets/list_of_names.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _nameHome;
  late String _meaningHome;
  var _viewCard = false;

  @override
  void initState() {
    Provider.of<ThemeManager>(context, listen: false).getPrefs();
    super.initState();
  }

  void clearName() {
    setState(() {
      _nameHome = '';
      _meaningHome = '';
      _viewCard = false;
    });
  }

  void pickName(String name, String meaning) {
    setState(() {
      _nameHome = name;
      _meaningHome = meaning;
      _viewCard = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final _names =
        Provider.of<DataProvider>(context, listen: true).namesOfAllah;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO fix the dialog
          showAboutDialog(
            context: context,
            children: [
              const Text('تم تطويره من قبل:',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl),
              const Text(
                'أحمد العمودي',
                textAlign: TextAlign.end,
              ),
              const Text(
                'Ahmed@amoudi',
                textAlign: TextAlign.end,
              ),
              const Text(
                'حسن الحامد',
                textAlign: TextAlign.end,
              ),
              const Text(
                'hassan@hamed',
                textAlign: TextAlign.end,
              ),
            ],
          );
        },
        child: const Icon(Icons.question_mark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const MyAppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Image.asset(
          //   'assets/images/background.png',
          //   height: double.infinity,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Column(
            children: [
              Container(
                height: sizeHeight * 0.3,
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 0,
                  right: 20,
                  left: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(201, 203, 130, 239),
                      Color.fromARGB(201, 103, 43, 187),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: _viewCard
                    ? InformationCard(
                        _nameHome,
                        _meaningHome,
                        clearName,
                      )
                    : const InformationCard(
                        'إختر من قائمة الأسماء',
                        'سيتم عرض الوصف هنا',
                        null,
                      ),
              ),
              ListOfNames(_names, pickName),
            ],
          ),
        ],
      ),
    );
  }
}
