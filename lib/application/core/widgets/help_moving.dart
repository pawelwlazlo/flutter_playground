import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpMovingWidget extends StatelessWidget {
  final bool left;
  const HelpMovingWidget({super.key, this.left = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (left) ...{
          FaIcon(FontAwesomeIcons.chevronLeft,
              size: 12, color: theme.colorScheme.onPrimaryContainer),
        },
        Text('Przesuń',
            style: TextStyle(color: theme.colorScheme.onPrimaryContainer)),
        if (!left) ...{
          FaIcon(FontAwesomeIcons.chevronRight,
              size: 12, color: theme.colorScheme.onPrimaryContainer),
        },
        const SizedBox(width: 10),
      ],
    );
  }
}
