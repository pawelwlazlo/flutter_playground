import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bank_bloc.dart';

class BankActionButton extends StatelessWidget {
  final BankEvent bankEvent;
  final String buttonText;

  const BankActionButton({super.key, required this.bankEvent, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<BankBloc>(context).add(bankEvent);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(
            side: BorderSide(
                color: Colors.black54,
                width: 4
            )
        ),
        padding: const EdgeInsets.all(54),
      ),
      child: Text(buttonText, style: TextStyle(
          color: Colors.black54, fontSize: themeData.textTheme.displayLarge?.fontSize
      ),),
    );
  }
}
