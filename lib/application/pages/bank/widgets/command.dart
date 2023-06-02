import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/bank/bloc/bank_bloc.dart';
import 'package:flutter_playground/application/pages/bank/widgets/bank_action_button.dart';


class Command extends StatelessWidget {
  final String buttonText;
  final BankEvent bankEvent;

  const Command({super.key, required this.buttonText, required this.bankEvent});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BankActionButton(bankEvent: bankEvent, buttonText: buttonText)
        ],
      ),
    );
  }
}
