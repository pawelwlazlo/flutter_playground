import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_app_bar.dart';

class BankTrasferPage extends StatelessWidget {
  const BankTrasferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bankState = context.watch<BankCubit>().state;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Bank transfer',
        ),
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: themeData.colorScheme.onPrimary,
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Bank transfer"),
                      ],
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              color: themeData.colorScheme.onSecondary,
            )),
          ],
        ),
      ),
    );
  }
}
