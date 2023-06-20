import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_app_bar.dart';

class BankTrasferPage extends StatelessWidget {
  const BankTrasferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    var bankCubit = context.watch<BankCubit>();
    final bankState = bankCubit.state;
    final bankTransferCubit = Provider.of<BankTransferCubit>(context);
    var numberFormat = NumberFormat('#.00##', 'pl_PL');
    final kwota = numberFormat.format(bankState.amount?.toDouble());
    bankTransferCubit.setKwota(bankState.amount!);
    bankTransferCubit.setFromAccount(bankState.activeBank!);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Bank transfer',
        ),
        body: BlocConsumer<BankTransferCubit, BankTransferState>(
          listener: (context, state) {
            if (state.status == BankTransferStateEnum.bankTransferStateTransferEnded) {
              Navigator.pop(context);
            } else if (state.status == BankTransferStateEnum.bankTransferStateTransferInProgress) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(strokeWidth: 5),
                      Text('Wykonuję przelew...', style: themeData.textTheme.displayLarge?.copyWith(color: themeData.colorScheme.onPrimary)),
                    ],
                  ),
                ),
              );
            } else if (state.status == BankTransferStateEnum.bankTransferStateTransferCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Przelew zakończony sukcesem', style: themeData.textTheme.displayLarge?.copyWith(color: themeData.colorScheme.onPrimary)),
                  duration: const Duration(days: 1),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      bankTransferCubit.completeTransfer();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  )
                ),
              );
            } else if (state.status == BankTransferStateEnum.bankTransferStateTransferFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Przelew nieudany'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: themeData.colorScheme.onPrimary,
                      child: SingleChildScrollView(
                        child: Form (
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        bankState.activeBank!.bank.logoUrl,
                                        width: 75,
                                      ),
                                      Text(
                                        bankState.activeBank!.accountNumber,
                                        style: themeData.textTheme.displayMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('Nr karty: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            bankState.activeBank!.cardNumber,
                                            style:
                                                themeData.textTheme.displayMedium,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Kwota:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        '$kwota PLN',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: themeData.colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Rachunek odbiorcy',
                                      hintText: 'Rachunek odbiorcy',
                                      icon: const Icon(FontAwesomeIcons.buildingColumns),
                                      errorText: makeErrorText(cubit: bankTransferCubit, formzField: state.accountNumber),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    controller: MaskedTextController(
                                        mask: '0000 0000 0000 0000 0000 0000', text: bankTransferCubit.state.accountNumber.value),
                                    onChanged: (value) {
                                      bankTransferCubit.setRecipientAccountNumber(value);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Tytuł przelewu',
                                      hintText: 'Tytuł przelewu',
                                      icon: const Icon(FontAwesomeIcons.pen),
                                      errorText: makeErrorText(cubit: bankTransferCubit, formzField: state.title),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    initialValue: bankTransferCubit.state.title.value,
                                    onChanged: (value) {
                                      bankTransferCubit.setTitle(value);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Nazwa odbiorcy',
                                      hintText: 'Nazwa odbiorcy',
                                      icon: const Icon(FontAwesomeIcons.user),
                                      errorText: makeErrorText(cubit: bankTransferCubit, formzField: state.recipientName),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    initialValue: bankTransferCubit.state.recipientName.value,
                                    onChanged: (value) {
                                      bankTransferCubit.setAccountHolderName(value);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Adres odbiorcy',
                                      hintText: 'Adres odbiorcy',
                                      icon: const Icon(FontAwesomeIcons.addressBook),
                                      errorText: makeErrorText(cubit: bankTransferCubit, formzField: state.recipientAddress),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    initialValue: bankTransferCubit.state.recipientAddress.value,
                                    onChanged: (value) {
                                      bankTransferCubit.setRecipientAddress(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 46.0),
                    ElevatedButton(
                      onPressed: () {
                        bankTransferCubit.transfer();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                                color: themeData.colorScheme.primary,
                                width: 4)),
                        padding: const EdgeInsets.all(54),
                      ),
                      child: const Text('Wykonaj przelew'),
                    ),
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }

  makeErrorText({required FormzInput formzField, required BankTransferCubit cubit}) {
    if(cubit.state.status != BankTransferStateEnum.bankTransferStateFormError) {
      return null;
    }
    if (formzField.isNotValid) {
      final BankTransferStateErrorEnum error = formzField.error;
      return switch(error) {
        BankTransferStateErrorEnum.bankTransferStateErrorInvalidAccountNumber => 'Nieprawidłowy numer konta',
        BankTransferStateErrorEnum.bankTransferStateErrorInvalidTitle => 'Nieprawidłowy tytuł przelewu',
        BankTransferStateErrorEnum.bankTransferStateErrorInvalidAccountHolderName => 'Nieprawidłowy odbiorca przelewu',
        BankTransferStateErrorEnum.bankTransferStateErrorInvalidRecipientAddress => 'Nieprawidłowy adres odbiorcy',
        _ => 'Nieprawidłowe dane',
      };
    } else {
      return null;
    }
  }


}

class FormTextInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final Function? onChanged;
  final Function? validator;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final TextInputType keyboardType;

  const FormTextInput(
      {super.key,
      required this.label,
      required this.hint,
      this.icon,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      required this.controller,
      this.initialValue,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      keyboardType: keyboardType, // const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        errorText: validator != null ? validator!(controller.text) : null,
        labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: theme.colorScheme.primary),
        border: const UnderlineInputBorder(),
        // const OutlineInputBorder(),
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: FaIcon(
            icon,
            size: 14,
            color: theme.colorScheme.primary,
          ), // Icon(Icons.attach_money),
        ),
      ),
      textAlign: TextAlign.left,
      style: theme.textTheme.displayMedium,
      onChanged: onChanged as void Function(String)?,
    );
  }
}
