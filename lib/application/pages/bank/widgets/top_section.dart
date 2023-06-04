import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bank_cubit.dart';

class BankTopSection extends StatelessWidget {
  const BankTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<BankCubit>(context);
    return BlocBuilder<BankCubit, BankCubitState>(builder: (context, state) {
      if (state is BankInitial) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Ładuję listę banków'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            )
          ],
        );
      } else if (state is BankListLoaded) {
        return PageView.builder(
          itemCount: state.bankAccounts.length,
          onPageChanged: (index) {
            blocProvider.changeBankPage(index);
          },
          itemBuilder: (context, index) {
            final bankAccount = state.bankAccounts[index];
            return Column(
              children: [
                Text(bankAccount.cardNumber),
                Text(bankAccount.balance.toString()),
              ],
            );
          },
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
