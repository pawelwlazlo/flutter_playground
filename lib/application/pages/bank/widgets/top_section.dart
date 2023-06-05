import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bank_cubit.dart';

class BankTopSection extends StatelessWidget {
  const BankTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<BankCubit>(context);
    return BlocBuilder<BankCubit, BankCubitState>(builder: (context, state) {
      final stateModel = state.bankStateModel;
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
      } else {
        return PageView.builder(
          itemCount: stateModel.bankAccounts.length,
          onPageChanged: (index) {
            blocProvider.changeBankPage(index);
          },
          itemBuilder: (context, index) {
            final bankAccount = stateModel.bankAccounts[index];
            return Container(
              color: bankAccount.bank.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bankAccount.bank.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      bankAccount.bank.logoUrl,
                      height: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Saldo: ${bankAccount.balance} PLN',
                      style: const TextStyle(
                        fontSize: 16 * 1.2, // Ustawiamy czcionkę o 20% większą
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Karta: ${bankAccount.cardNumber}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
  }
}
