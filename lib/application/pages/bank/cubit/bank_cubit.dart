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
      bankAccounts.fold((l) => emit(BankStateError(failure: l)),
          (r) => emit(BankListLoaded(bankAccounts: r)));
    });
  }

  Future<void> generateBlik() async {
    emit(BankStateBlikRequested());
    debugPrint('Otrzymano zapytanie o BLIK');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Otrzymano kod blik');
    emit(const BankStateBlikReceived(blikNumber: 321453));
  }

  Future<void> makePrzelew() async {
    emit(BankStateBlikRequested());
    debugPrint('Otrzymano zapytanie o BLIK');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Otrzymano kod blik');
    emit(const BankStatePrzelewSended(kwota: 321453));
  }

  void changeBankPage(int index) {
    debugPrint('zmieniam bank na $index');
    emit(BankPageChanged(index: index));
  }
}
