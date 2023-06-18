import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
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

    var numberFormat = NumberFormat('#.00##', 'pl_PL');
    final kwota = numberFormat.format(bankState.kwota?.toDouble());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Bank transfer',
        ),
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: themeData.colorScheme.onPrimary,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(
                                    child: Text('Z konta: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      bankState.activeBank!.accountNumber,
                                      style: themeData.textTheme.displayMedium,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Kwota: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(
                                  '$kwota PLN',
                                  style: themeData.textTheme.displayLarge,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                            child: FormTextInput(
                              label: 'Na rachunek',
                              hint: 'Na rachunek',
                              icon: FontAwesomeIcons.buildingColumns,
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                            child: FormTextInput(
                              label: 'Tytuł przelewu',
                              hint: 'Tytuł przelewu',
                              icon: FontAwesomeIcons.buildingColumns,
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
                            child: FormTextInput(
                              label: 'Nazwa odbiorcy',
                              hint: 'Nazwa odbiorcy',
                              icon: FontAwesomeIcons.buildingColumns,
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FormTextInput(
                              label: 'Adres odbiorcy',
                              hint: 'Adres odbiorcy',
                              icon: FontAwesomeIcons.buildingColumns,
                              onChanged: (value) {},
                              validator: (value) {},
                            ),
                          ),
                        ],
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                        side: BorderSide(
                            color: themeData.colorScheme.primary, width: 4)),
                    padding: const EdgeInsets.all(54),
                  ),
                  child: const Text('Wykonaj przelew'),
                ),
              ],
            )),
          ],
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
  final List<TextInputFormatter>? inputFormatters;

  const FormTextInput(
      {super.key,
      required this.label,
      required this.hint,
      this.icon,
      this.onChanged,
      this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = TextEditingController();
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: inputFormatters,
      onSubmitted: (value) {
        final bankCubit = BlocProvider.of<BankCubit>(context);
        bankCubit.setKwota(value);
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            fontSize: 16,
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
      textAlign: TextAlign.left,
      style: theme.textTheme.displayMedium,
    );
  }
}
