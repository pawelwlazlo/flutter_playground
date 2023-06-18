import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_state_model.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../core/widgets/custom_app_bar.dart';

class BankTrasferPageWrapperProvider extends StatelessWidget {
  const BankTrasferPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BankTransferCubit>(),
        child: const BankTrasferPage());
  }
}

class BankTrasferPage extends StatelessWidget {
  const BankTrasferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bankState = context.watch<BankCubit>().state.bankStateModel;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Bank transfer',
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              color: themeData.colorScheme.onPrimary,
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
