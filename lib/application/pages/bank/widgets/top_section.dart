import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bank_cubit.dart';

class BankTopSection extends StatelessWidget {
  const BankTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<BankCubit>(context);
    final ThemeData themeData = Theme.of(context);
    return BlocBuilder<BankCubit, BankCubitState>(builder: (context, state) {
      if (state.status == BankStateEnum.initial) {
        return Container(
          color: themeData.colorScheme.secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Ładuję listę banków'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: themeData.colorScheme.background,
                ),
              )
            ],
          ),
        );
      } else {
        return PageView.builder(
          itemCount: state.bankAccounts.length,
          onPageChanged: (index) {
            blocProvider.changeBankPage(index);
          },
          itemBuilder: (context, index) {
            final bankAccount = state.bankAccounts[index];
            return Container(
              color: themeData.colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bankAccount.bank.name,
                      style: TextStyle(
                        fontSize: 24,
                        color: themeData.colorScheme.onPrimary,
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
                      style: TextStyle(
                        fontSize: 16 * 1.2, // Ustawiamy czcionkę o 20% większą
                        fontWeight: FontWeight.w500,
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Karta: ${bankAccount.cardNumber}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: themeData.colorScheme.onPrimary,
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
