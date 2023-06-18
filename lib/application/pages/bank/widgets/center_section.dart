import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/bank_cubit.dart';

class BankCenterSection extends StatelessWidget {
  const BankCenterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: Center(
            child: BlocBuilder<BankCubit, BankCubitState>(
                builder: (context, state) {
              final status = state.status;
              if (status == BankStateEnum.bankLoggedIn) {
                return const KwotaPrompt();
              } else if (status == BankStateEnum.bankStateBlikRequested ||
                  status  == BankStateEnum.bankStateTransactionCreated) {
                return CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                );
              }
              return const KwotaPrompt();

              /*else if (state is BankStatePrzelewSended) {
                return Text('Wysłano przelew na kwotę: ${stateModel.kwota}');
              } else if (state is BankStateBlikReceived) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('Otrzymano kod blik: ${stateModel.blikNumber}'),
                        Text('Dla konta: ${stateModel.activeBank?.cardNumber}'),
                      ],
                    ),
                  ],
                );
              } else if (state is BankStateCommandPageChanged) {
                return const KwotaPrompt();
              } else {
                return const KwotaPrompt();
              }*/
            }),
          ),
        )
      ],
    );
  }
}

class KwotaPrompt extends StatelessWidget {
  const KwotaPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController amountController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Wprowadź kwotę:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary)),
          const SizedBox(height: 16),
          TextField(
            controller: amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*,?\d*')),
            ],
            onSubmitted: (value) {
              final bankCubit = BlocProvider.of<BankCubit>(context);
              bankCubit.setKwota(value);
            },
            decoration: InputDecoration(
              labelText: 'Kwota',
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary),
              border: const OutlineInputBorder(),
              prefixIconConstraints: const BoxConstraints(),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: FaIcon(
                  FontAwesomeIcons.buildingColumns,
                  size: 14,
                  color: theme.colorScheme.primary,
                ), // Icon(Icons.attach_money),
              ),
            ),
            textAlign: TextAlign.center,
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
