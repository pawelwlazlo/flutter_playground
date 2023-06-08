import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              final stateModel = state.bankStateModel;
              if (state is BankInitial) {
                return const Text('Bank jest ok');
              } else if (state is BankStateBlikRequested ||
                  state is BankStatePrzelewRequested) {
                return CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                );
              } else if (state is BankStatePrzelewSended) {
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
              }
              return const SizedBox();
            }),
          ),
        )
      ],
    );
  }
}
