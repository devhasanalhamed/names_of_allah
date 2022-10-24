import 'package:flutter/material.dart';
import 'package:names_of_allah/providers/namesProvider.dart';
import 'package:names_of_allah/theme/theme_manager.dart';
import 'package:names_of_allah/widgets/appbar.dart';
import 'package:names_of_allah/widgets/information_card.dart';
import 'package:names_of_allah/widgets/list_of_names.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _nameHome;
  late String _meaningHome ;
  var _viewCard = false;

  @override
  void initState() {
    Provider.of<ThemeManager>(context,listen: false).getPrefs();
    super.initState();
  }

  void clearName(){
    setState(() {
      _nameHome = '';
      _meaningHome = '';
      _viewCard = false;
    });
  }

  void pickName(String name, String meaning){
    setState(() {
      _nameHome = name;
      _meaningHome = meaning;
      _viewCard = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final _names = Provider.of<DataProvider>(context, listen: true).namesOfAllah;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAboutDialog(
            context: context,
            children: [
              const Text('تم تطويره من قبل:',textAlign: TextAlign.center,textDirection: TextDirection.rtl),
              const Text('أحمد العمودي',textAlign: TextAlign.end,),
              const Text('Ahmed@amoudi',textAlign: TextAlign.end,),
              const Text('حسن الحامد',textAlign: TextAlign.end,),
              const Text('hassan@hamed',textAlign: TextAlign.end,),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed('routeName'),
              ),
            ],
          );
        },
        child: const Icon(Icons.question_mark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const MyAppBar(),
      body: Column(
        children: [
          Container(
            height: sizeHeight * 0.3,
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 0,
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: _viewCard
                ? InformationCard(_nameHome, _meaningHome,clearName,)
                :const InformationCard('إختر من قائمة الأسماء','سيتم عرض الوصف هنا',null,),
          ),
          ListOfNames(_names, pickName),
        ],
      ),
    );
  }
}
