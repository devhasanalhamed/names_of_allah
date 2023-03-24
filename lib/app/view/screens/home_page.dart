import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:names_of_allah/app/controllers/dataProvider.dart';
import 'package:names_of_allah/app/view/widgets/fab_widget.dart';
import 'package:names_of_allah/core/controllers/theme_manager.dart';
import 'package:names_of_allah/app/view/widgets/appbar.dart';
import 'package:names_of_allah/app/view/widgets/list_of_names.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<ThemeManager>(context, listen: false).getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _names =
        Provider.of<DataProvider>(context, listen: true).namesOfAllah;
    return Scaffold(
      floatingActionButton: const MyFABWidget(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(),
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/background.svg',
              color: Theme.of(context).colorScheme.primary,
              height: 400,
              width: 400,
            ),
          ),
          Column(
            children: [
              ListOfNames(_names),
            ],
          ),
        ],
      ),
    );
  }
}
