import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/bank/bloc/bank_bloc.dart';
import 'package:flutter_playground/application/pages/bank/widgets/command.dart';

class BankBottomSection extends StatelessWidget {
  const BankBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Command(buttonText:"BLIK", bankEvent: BlikRequestedEvent(),),
        Command(buttonText: "Przelew", bankEvent: PrzelewRequestedEvent(),)
      ],
    );
  }
}
