import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/core/widgets/custom_app_bar.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank/widgets/bottom_section.dart';
import 'package:flutter_playground/application/pages/bank/widgets/center_section.dart';
import 'package:flutter_playground/application/pages/bank/widgets/top_section.dart';

import '../../../injection.dart';

class BankPageWrapperProvider extends StatelessWidget {
  const BankPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BankCubit>(), child: const BankPage());
  }
}

class BankPage extends StatelessWidget {
  const BankPage({super.key});
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.onPrimary,
        appBar: const CustomAppBar(),
        body: const Center(
          child: Column(children: <Widget>[
            Expanded(child: BankTopSection()),
            Expanded(child: BankCenterSection()),
            Expanded(child: BankBottomSection()),
          ]),
        ));
  }
}
