import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text(
        "Easy Bank",
        style: TextStyle(color: themeData.colorScheme.onPrimary),
      ),
      titleTextStyle: themeData.textTheme.displayMedium,
      backgroundColor: themeData.colorScheme.primary,
      actions: [
        Switch(
            activeColor: themeData.colorScheme.primary,
            activeTrackColor: themeData.colorScheme.onPrimary,
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
