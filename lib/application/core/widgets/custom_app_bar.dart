import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: const Text("Easy Bank"),
      titleTextStyle: themeData.textTheme.displaySmall,
      actions: [
        Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
