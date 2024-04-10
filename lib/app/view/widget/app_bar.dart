import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/data_provider.dart';
import '../../../core/theme/theme_controller/theme_controller.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _MyAppBarState extends State<MyAppBar> {
  var _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Theme.of(context).colorScheme.background),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                autofocus: true,
                onChanged: (value) =>
                    Provider.of<DataProvider>(context, listen: false)
                        .searchInList(value),
              ),
            )
          : const Text('أسماء الله الحُسنى'),
      actions: _isSearching
          ? null
          : [
              IconButton(
                icon: Provider.of<ThemeController>(context, listen: true)
                        .isDarkMode
                    ? const Icon(
                        Icons.sunny,
                      )
                    : const Icon(
                        Icons.nightlight_round,
                      ),
                onPressed: () =>
                    Provider.of<ThemeController>(context, listen: false)
                        .toggleTheme(),
              ),
            ],
      leading: IconButton(
        onPressed: () => {
          if (_isSearching)
            Provider.of<DataProvider>(context, listen: false).returnOriginal(),
          setState(() {
            _isSearching = !_isSearching;
          }),
        },
        icon: _isSearching
            ? const Icon(
                Icons.clear,
              )
            : const Icon(
                Icons.search,
              ),
      ),
    );
  }
}
