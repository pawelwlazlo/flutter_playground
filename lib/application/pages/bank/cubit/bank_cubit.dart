import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/domain/bank/entities/bank_account.dart';
import 'package:flutter_playground/domain/core/failure.dart';
import '../../../../domain/bank/usecases/get_bank_accounts_use_case.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  final GetBankAccountsUseCase _getBankAccountsUseCase;

  BankCubit(this._getBankAccountsUseCase) : super(BankInitial()) {
    _getBankAccountsUseCase.call().then((bankAccounts) {
      bankAccounts.fold((l) => updateState(failure: l),
          (r) => updateState(bankAccounts: r, activeBank: r.first));
    });
  }

  void selectBankAccount(BankAccount bank) {
    updateState(activeBank: bank);
  }

  Future<void> generateBlik() async {
    updateState(blikNumber: null);
    emit(BankStateBlikRequested(stateModel: state.stateModel));
    debugPrint('Otrzymano zapytanie o BLIK');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Otrzymano kod blik');
    updateState(blikNumber: 321453);
    emit(BankStateBlikReceived(stateModel: state.stateModel));
  }

  Future<void> makePrzelew(Decimal kwota) async {
    updateState(kwota: kwota);
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint(
        'Wysłano przelew z konta ${state.stateModel.activeBank?.accountNumber}');
    updateState(kwota: Decimal.zero);
  }

  void changeBankPage(int index) {
    debugPrint('zmieniam bank na $index');
    updateState(activeBank: state.stateModel.bankAccounts[index]);
  }

  void updateState({
    List<BankAccount>? bankAccounts,
    BankAccount? activeBank,
    int? blikNumber,
    Decimal? kwota,
    Failure? failure,
  }) {
    final currentStateModel = state.stateModel;
    final newStateModel = currentStateModel.copyWith(
      bankAccounts: bankAccounts,
      activeBank: activeBank ?? currentStateModel.activeBank,
      blikNumber: blikNumber ?? currentStateModel.blikNumber,
      kwota: kwota ?? currentStateModel.kwota,
      failure: failure ?? currentStateModel.failure,
    );
    final newState = state.copyWith(newModel: newStateModel);
    emit(newState);
  }
}
