import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/bank/bloc/bank_bloc.dart';
import 'package:flutter_playground/application/pages/bank/widgets/bank_action_button.dart';

class BankBottomSection extends StatelessWidget {
  const BankBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BankActionButton(
                bankEvent: BlikRequestedEvent(), buttonText: 'BLIK')
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BankActionButton(
                bankEvent: PrzelewRequestedEvent(), buttonText: 'Przelew')
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BankActionButton(
                bankEvent: BlikRequestedEvent(), buttonText: 'Przelew')
          ],
        ),
      ],
    );
  }
}
