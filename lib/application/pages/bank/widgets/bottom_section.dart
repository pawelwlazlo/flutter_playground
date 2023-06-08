import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank/widgets/bank_action_button.dart';

class BankBottomSection extends StatelessWidget {
  const BankBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<BankCubit>(context);
    final theme = Theme.of(context);
    return PageView(
      onPageChanged: (index) {
        blocProvider.changeCommandPage(index);
      },
      children: <Widget>[
        Container(
          color: theme.colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BankActionButton(
                  bankEvent: () =>
                      blocProvider.makePrzelew(Decimal.parse('300.89')),
                  buttonText: 'Przelew')
            ],
          ),
        ),
        Container(
          color: theme.colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BankActionButton(
                  bankEvent: () => blocProvider.generateBlik(),
                  buttonText: 'BLIK')
            ],
          ),
        ),
      ],
    );
  }
}
