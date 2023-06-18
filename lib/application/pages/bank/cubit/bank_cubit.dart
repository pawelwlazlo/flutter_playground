import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/domain/bank/entities/bank_account.dart';
import 'package:flutter_playground/domain/core/failure.dart';
import 'package:intl/intl.dart';

import '../../../../domain/bank/usecases/get_bank_accounts_use_case.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  final GetBankAccountsUseCase _getBankAccountsUseCase;

  BankCubit(this._getBankAccountsUseCase) : super(BankCubitState.initial());



  Future<void> logIn({
    required int userId,
    required String login,
    required String fullName,
  }) async {
    debugPrint('Zalogowano');
    await loadBanks(userId: userId);
    emit(state.copyWith(status: BankStateEnum.bankLoggedIn,
        userId: userId,
        login: login,
        fullName: fullName));
    }

  Future<void> loadBanks({required int userId}) async {
    _getBankAccountsUseCase.call().then((bankAccounts) {
      bankAccounts.fold(
              (l) => emit(state.copyWith(failure: l)),
              (r) =>
              emit(state
                  .copyWith(status: BankStateEnum.bankListLoaded,
                  bankAccounts: r,
                  activeBank: r.first)));
    });
  }



  Future<void> generateBlik() async {
    final Faker faker = Faker.instance;
    emit(state.copyWith(status: BankStateEnum.bankStateBlikRequested));
    debugPrint('Otrzymano zapytanie o BLIK');
    await Future.delayed(const Duration(seconds: 3), () {});
    debugPrint('Otrzymano kod blik');
    emit(state.copyWith(status: BankStateEnum.bankStateBlikReceived, blikNumber: faker.datatype.number(min: 100000, max: 999999)));
  }


  Future<void> createTransaction() async {
    if (state.kwota != null && state.kwota!.compareTo(Decimal.zero) > 0) {
      emit(state.copyWith(status: BankStateEnum.bankStateTransactionCreated));
    }
  }

  void changeBankPage(int index) {
    debugPrint('zmieniam bank na $index');
    emit(state.copyWith(status: BankStateEnum.bankPageChanged, activeBank: state.bankAccounts[index]));
  }

  void changeCommandPage(int index) {
    debugPrint('zmieniam komendę na $index');
    emit(state.copyWith(status: BankStateEnum.bankStateCommandPageChanged, activeCommand: index));
  }

  void setKwota(String kwota) {
    final numberFormat = NumberFormat('###.00#', 'pl_PL');
    final kwotaParsed = numberFormat.parse(kwota);
    emit(state.copyWith(status: BankStateEnum.bankStateKwotaChanged, kwota: Decimal.parse(kwotaParsed.toString())));
  }
}
