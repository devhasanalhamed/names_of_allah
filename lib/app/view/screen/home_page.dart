import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:names_of_allah/app/logic/data_provider.dart';
import 'package:names_of_allah/app/view/widget/fab_widget.dart';
import 'package:names_of_allah/app/view/widget/app_bar.dart';
import 'package:names_of_allah/app/view/widget/list_of_names.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final names = Provider.of<DataProvider>(context, listen: true).namesOfAllah;
    return Scaffold(
      floatingActionButton: const MyFABWidget(),
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(),
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              height: double.infinity,
              width: double.infinity,
              'assets/vectors/background.svg',
              theme: SvgTheme(
                currentColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Column(
            children: [
              ListOfNames(names),
            ],
          ),
        ],
      ),
    );
  }
}
