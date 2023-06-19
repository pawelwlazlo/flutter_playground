import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_app_bar.dart';

class BankTrasferPage extends StatelessWidget {
  const BankTrasferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bankState = context.watch<BankCubit>().state;
    final bankTransferCubit = Provider.of<BankTransferCubit>(context);
    var numberFormat = NumberFormat('#.00##', 'pl_PL');
    final kwota = numberFormat.format(bankState.kwota?.toDouble());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Bank transfer',
        ),
        body: BlocBuilder<BankTransferCubit, BankTransferState>(
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
                                      vertical: 12.0, horizontal: 8.0),
                                  child: FormTextInput(
                                    label: 'Na rachunek',
                                    hint: 'Na rachunek',
                                    icon: FontAwesomeIcons.buildingColumns,
                                    keyboardType: const TextInputType.numberWithOptions(
                                        decimal: true, signed: true),
                                    onChanged: (value) {
                                       bankTransferCubit.setRecipientAccountNumber(value);
                                    },
                                   /* validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Pole nie może być puste';
                                      }
                                      if (value.length < 26) {
                                        return 'Nieprawidłowy numer konta';
                                      }

                                      return null;
                                    },*/
                                    controller: MaskedTextController(
                                        mask: '0000 0000 0000 0000 0000 0000', text: bankTransferCubit.state.accountNumber.value),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: FormTextInput(
                                    label: 'Tytuł przelewu',
                                    hint: 'Tytuł przelewu',
                                    icon: FontAwesomeIcons.fileSignature,
                                    onChanged: (value) {
                                      bankTransferCubit.setTitle(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Pole nie może być puste';
                                      }
                                      if (value.length < 3) {
                                        return 'Tytuł przelewu musi zawierać minimum 3 znaki';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: FormTextInput(
                                    label: 'Nazwa odbiorcy',
                                    hint: 'Nazwa odbiorcy',
                                    icon: FontAwesomeIcons.users,
                                    onChanged: (value) {
                                      bankTransferCubit.setAccountHolderName(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Pole nie może być puste';
                                      }
                                      if (value.length < 3) {
                                        return 'Nazwa odbiorcy musi zawierać minimum 3 znaki';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: FormTextInput(
                                    label: 'Adres odbiorcy',
                                    hint: 'Adres odbiorcy',
                                    icon: FontAwesomeIcons.addressBook,
                                    onChanged: (value) {
                                      bankTransferCubit.setRecipientAddress(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Pole nie może być puste';
                                      }
                                      if (value.length < 3) {
                                        return 'Adres odbiorcy musi zawierać minimum 3 znaki';
                                      }
                                      return null;
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
}

class FormTextInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final Function? onChanged;
  final Function? validator;
  final TextEditingController? controller;
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
      this.controller,
      this.initialValue,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textController = controller ?? TextEditingController();
    return TextField(
      controller: textController,
      keyboardType: keyboardType, // const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        errorText: validator != null ? validator!(textController.text) : null,
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
