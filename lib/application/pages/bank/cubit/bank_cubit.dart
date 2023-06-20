import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/domain/bank/entities/bank_account.dart';
import 'package:flutter_playground/domain/core/failure.dart';
import 'package:intl/intl.dart';

import '../../../../domain/bank/usecases/get_bank_accounts_use_case.dart';
import '../../bank_transfer/cubit/bank_transfer_cubit.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  final GetBankAccountsUseCase getBankAccountsUseCase;
  final BankTransferCubit bankTransferCubit;
  late StreamSubscription bankTransferCubitSubscription;


  BankCubit({required this.getBankAccountsUseCase, required this.bankTransferCubit}) : super(BankCubitState.initial()) {
    bankTransferCubitSubscription = bankTransferCubit.stream.listen((BankTransferState state) {
        if (state.status == BankTransferStateEnum.bankTransferStateTransferEnded) {
          emit(this.state.copyWith(status: BankStateEnum.transactionEnded, kwota: null));
        }
    });
  }



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
    getBankAccountsUseCase.call().then((bankAccounts) {
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
    if(state.kwota == null) {
      return;
    }

    final kwota = state.kwota!;
    final numberFormat = NumberFormat('###.00#', 'pl_PL');
    final kwotaParsed = numberFormat.parse(kwota);
    final decimalKwota = Decimal.parse(kwotaParsed.toString());
    if (decimalKwota.compareTo(Decimal.zero) > 0) {
      emit(state.copyWith(status: BankStateEnum.bankStateTransactionCreated, amount: decimalKwota));
    }
  }

  Future<void> changeBankPage(int index) async {
    debugPrint('zmieniam bank na $index');
    emit(state.copyWith(status: BankStateEnum.bankPageChanged, activeBank: state.bankAccounts[index]));
  }

  Future<void> changeCommandPage(int index) async {
    debugPrint('zmieniam komendę na $index');
    emit(state.copyWith(status: BankStateEnum.bankStateCommandPageChanged, activeCommand: index));
  }

  Future<void> setKwota(String inputKwota) async {
    emit(state.copyWith(status: BankStateEnum.bankStateKwotaChanged, kwota: inputKwota));
  }

  void completeTransfer() {
    emit(state.copyWith(status: BankStateEnum.bankStateTransferCompleted, kwota: null));
  }
}
