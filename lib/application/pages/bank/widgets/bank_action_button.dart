import 'package:flutter/material.dart';

class BankActionButton extends StatelessWidget {
  // final BankEvent bankEvent;
  final String buttonText;
  final Function bankEvent;

  const BankActionButton(
      {super.key, required this.bankEvent, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: () {
        // BlocProvider.of<BankBloc>(context).add(bankEvent);
        bankEvent();
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(
            side: BorderSide(color: theme.colorScheme.primary, width: 4)),
        padding: const EdgeInsets.all(54),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: theme.textTheme.displayLarge?.fontSize),
      ),
    );
  }
}
