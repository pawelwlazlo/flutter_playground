import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_state_model.dart';

import '../../../../domain/bank/usecases/get_bank_accounts_use_case.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  final GetBankAccountsUseCase _getBankAccountsUseCase;

  BankCubit(this._getBankAccountsUseCase) : super(BankInitial()) {
    _getBankAccountsUseCase.call().then((bankAccounts) {
      bankAccounts.fold(
          (l) => emit(BankStateError(
              newModel: state.bankStateModel.copyWith(failure: l))),
          (r) => emit(BankListLoaded(
              newModel: state.bankStateModel
                  .copyWith(bankAccounts: r, activeBank: r.first))));
    });
  }
  Future<void> logIn(
      {
        required int userId,
        required String login,
      required String fullName,
      }) async {
    debugPrint('Zalogowano');
    emit(BankLoggedIn(
        newModel:
            state.bankStateModel.copyWith(userId: userId, login: login, fullName: fullName),
        ));
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

  Future<void> createTransaction() async {
    if(state.bankStateModel.kwota != null && state.bankStateModel.kwota!.compareTo(Decimal.zero) > 0) {
      emit(BankStateTransactionCreated(
        newModel: state.bankStateModel.copyWith(),
      ));
    }
  }

  void changeBankPage(int index) {
    debugPrint('zmieniam bank na $index');
    emit(BankPageChanged(
      newModel: state.bankStateModel
          .copyWith(activeBank: state.bankStateModel.bankAccounts[index]),
    ));
  }

  void changeCommandPage(int index) {
    debugPrint('zmieniam komendę na $index');
    emit(BankStateCommandPageChanged(
      newModel: state.bankStateModel.copyWith(activeCommand: index),
    ));
  }

  void setKwota(String kwota) {
    emit(BankStateKwotaChanged(
      newModel: state.bankStateModel.copyWith(kwota: Decimal.parse(kwota)),
    ));
  }
}
