import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/namesProvider.dart';
import '../theme/theme_manager.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

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
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Colors.black26),
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
      elevation: 0.0,
      centerTitle: true,
      actions: _isSearching
          ? null
          : [
              IconButton(
                icon:
                    Provider.of<ThemeManager>(context, listen: true).isDarkMode
                        ? const Icon(Icons.sunny)
                        : const Icon(Icons.nightlight_round),
                onPressed: () =>
                    Provider.of<ThemeManager>(context, listen: false)
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
        icon: _isSearching ? const Icon(Icons.clear) : const Icon(Icons.search),
      ),
    );
  }
}
