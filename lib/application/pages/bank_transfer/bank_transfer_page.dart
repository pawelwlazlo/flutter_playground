import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';

import '../../../injection.dart';
import '../../core/widgets/custom_app_bar.dart';

class BankTrasferPageWrapperProvider extends StatelessWidget {
  const BankTrasferPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BankTransferCubit>(), child: const BankTrasferPage());
  }
}

class BankTrasferPage extends StatelessWidget {
  const BankTrasferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Bank transfer',
      ),
      body: Center(
        child: Text('Bank transfer page'),
      )
    );
  }
}
