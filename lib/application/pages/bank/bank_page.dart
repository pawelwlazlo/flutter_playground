import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_bank/application/core/widgets/custom_app_bar.dart';
import 'package:easy_bank/application/pages/bank/cubit/bank_cubit.dart';
import 'package:easy_bank/application/pages/bank/widgets/bottom_section.dart';
import 'package:easy_bank/application/pages/bank/widgets/center_section.dart';
import 'package:easy_bank/application/pages/bank/widgets/top_section.dart';
import 'package:easy_bank/application/pages/bank_transfer/bank_transfer_page.dart';

import '../../../injection.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return BlocConsumer<BankCubit, BankCubitState>(
      listener: (context, state) {
        if (state.status == BankStateEnum.bankStateTransactionCreated) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BankTrasferPage()),
            );
        }
      },
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: themeData.colorScheme.onPrimary,
            appBar: const CustomAppBar(title: 'Easy Bank'),
            body: const Center(
              child: Column(children: <Widget>[
                Expanded(child: BankTopSection()),
                Expanded(child: BankCenterSection()),
                Expanded(child: BankBottomSection()),
              ]),
            ));
      },
    );
  }
}
