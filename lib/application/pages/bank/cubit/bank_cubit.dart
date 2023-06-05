import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_state_model.dart';

import '../../../../domain/bank/usecases/get_bank_accounts_use_case.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  final GetBankAccountsUseCase _getBankAccountsUseCase;

  BankCubit(this._getBankAccountsUseCase) : super(BankInitial.initial()) {
    _getBankAccountsUseCase.call().then((bankAccounts) {
      bankAccounts.fold(
          (l) => emit(
              BankStateError(newModel: state.bankStateModel.copyWith(failure: l))),
          (r) => emit(BankListLoaded(
              newModel: state.bankStateModel.copyWith(
                  bankAccounts: r,
                  activeBank: r.first))));
    });
  }

  Future<void> generateBlik() async {
    emit(BankStateBlikRequested(
      newModel: state.bankStateModel.copyWith(),
    ));
    debugPrint('Otrzymano zapytanie o BLIK');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Otrzymano kod blik');
    emit(BankStateBlikReceived(
        newModel: state.bankStateModel.copyWith(blikNumber: 123456)));
  }

  Future<void> makePrzelew(Decimal kwota) async {
    emit(BankStatePrzelewRequested(
      newModel: state.bankStateModel.copyWith(),
    ));
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Wysłano przelew z konta ${state..bankStateModel.activeBank?.accountNumber}');
    emit(BankStatePrzelewSended(
        newModel: state.bankStateModel.copyWith(kwota: kwota)));
  }

  void changeBankPage(int index) {
    debugPrint('zmieniam bank na $index');
    emit(BankPageChanged(
      newModel: state.bankStateModel.copyWith(
          activeBank: state.bankStateModel.bankAccounts[index]),
    ));
  }
}
