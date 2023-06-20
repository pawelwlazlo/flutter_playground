import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/bank_cubit.dart';

class BankCenterSection extends StatelessWidget {
  const BankCenterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextEditingController amountController = TextEditingController();
    return Column(
      children: [
        Expanded(
          child: Center(
            child: BlocConsumer<BankCubit, BankCubitState>(
                listener: (context, state) {
              if (state.status == BankStateEnum.bankStateBlikServiceRequested) {
                showDialog(
                    context: context,
                    builder: (BuildContext buildContext) =>
                        const ConfirmationDialog()).then(
                    (value) =>
                        context.read<BankCubit>().setBlikConfirmed(value),
                    onError: (error) =>
                        context.read<BankCubit>().setBlikConfirmed(false));
              }
            }, builder: (context, state) {
              final status = state.status;
              if (status == BankStateEnum.bankStateBlikRequested) {
                return CircularProgressIndicator(
                  color: theme.colorScheme.secondary,
                );
              }
              if (status == BankStateEnum.transactionEnded) {
                amountController.clear();
              }
              if (status == BankStateEnum.bankStateBlikReceived) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Twój kod BLIK to:',
                        style: theme.textTheme.displayMedium),
                    const SizedBox(height: 16),
                    Text('${state.blikNumber}',
                        style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 32)),
                  ],
                );
              }
              if (status == BankStateEnum.bankStateBlikExpired) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Kod BLIK wygasł:',
                        style: theme.textTheme.displayMedium),
                    const SizedBox(height: 16),
                    Text('${state.blikNumber}',
                        style: theme.textTheme.displayLarge?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 32)),
                  ],
                );
              }
              // wybieramy BLIK
              if (state.activeCommand == 1) {
                return SvgPicture.asset(
                  'assets/icons/blik.svg',
                );
              }
              // wybieramy przelew
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+,?\d*')),
                      ],
                      onChanged: (value) {
                        context
                            .read<BankCubit>()
                            .setKwota(amountController.text);
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
                  ),
                ],
              );
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
    final bankCubit = context.watch<BankCubit>();
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
/*
            onSubmitted: (value) {
              final bankCubit = BlocProvider.of<BankCubit>(context);
              bankCubit.setKwota(value);
            },
*/
            onChanged: (value) {
              bankCubit.setKwota(amountController.text);
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

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Potwierdź transakcję'),
      content: const Text('Czy na pewno chcesz zrealizować tę transakcję?'),
      actions: [
        TextButton(
          onPressed: () {
            // Tutaj możesz dodać logikę po naciśnięciu przycisku "Tak"
            Navigator.of(context)
                .pop(true); // Zamknij dialog i zwróć wartość true
          },
          child: const Text('Tak'),
        ),
        TextButton(
          onPressed: () {
            // Tutaj możesz dodać logikę po naciśnięciu przycisku "Nie"
            Navigator.of(context)
                .pop(false); // Zamknij dialog i zwróć wartość false
          },
          child: const Text('Nie'),
        ),
      ],
    );
  }
}
