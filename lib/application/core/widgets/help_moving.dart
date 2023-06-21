import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpMovingWidget extends StatelessWidget {
  const HelpMovingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FaIcon(FontAwesomeIcons.chevronLeft,
            color: theme.colorScheme.inversePrimary),
        Text('Przesuń',
            style: TextStyle(color: theme.colorScheme.inversePrimary)),
        const SizedBox(width: 10),
      ],
    );
  }
}
