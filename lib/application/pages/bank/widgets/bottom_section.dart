import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_bank/application/core/widgets/help_moving.dart';
import 'package:easy_bank/application/pages/bank/cubit/bank_cubit.dart';
import 'package:easy_bank/application/pages/bank/widgets/bank_action_button.dart';

class BankBottomSection extends StatelessWidget {
  const BankBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bankCubit = BlocProvider.of<BankCubit>(context);
    final theme = Theme.of(context);
    return BlocBuilder<BankCubit, BankCubitState>(
      builder: (context, state) {
        return PageView(
          onPageChanged: (index) {
            bankCubit.changeCommandPage(index);
          },
          children: <Widget>[
            Container(
              color: theme.colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BankActionButton(
                      bankEvent: () {
                        return bankCubit.createTransaction();
                      },
                      buttonText: 'Przelew'),
                  const HelpMovingWidget(
                    left: true,
                  )
                ],
              ),
            ),
            Container(
              color: theme.colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BankActionButton(
                      bankEvent: () => bankCubit.generateBlik(),
                      buttonText: 'BLIK'),
                  const HelpMovingWidget(
                    left: false,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
