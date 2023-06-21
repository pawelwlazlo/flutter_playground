import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_bank/domain/bank/entities/bank_account.dart';
import 'package:easy_bank/domain/core/failure.dart';
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
          emit(this.state.copyWith(status: BankStateEnum.transactionEnded, amountFieldValue: null));
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
    var generatedNumber = faker.datatype.number(min: 100000, max: 999999);
    emit(state.copyWith(status: BankStateEnum.bankStateBlikReceived, blikNumber: generatedNumber));
    if(generatedNumber % 2 == 0) {
      emit(state.copyWith(status: BankStateEnum.bankStateBlikExpired));
      return;
    }
    await Future.delayed(const Duration(seconds: 3), () {});
    var generatedBlikAmount = faker.datatype.number(min: 300, max: 600);
    var generatedBlikAmountDec = Decimal.parse(generatedBlikAmount.toString());
    emit(state.copyWith(status: BankStateEnum.bankStateBlikServiceRequested, blikAmount: generatedBlikAmountDec));
    // emit(state.copyWith(status: BankStateEnum.bankStateBlikConfirmed));
  }


  Future<void> createTransaction() async {
    if(state.amountFieldValue == null) {
      return;
    }

    final kwota = state.amountFieldValue!;
    final numberFormat = NumberFormat('###.00#', 'pl_PL');
    final kwotaParsed = numberFormat.parse(kwota);
    final decimalKwota = Decimal.parse(kwotaParsed.toString());
    if (decimalKwota.compareTo(Decimal.zero) > 0) {
      emit(state.copyWith(status: BankStateEnum.bankStateTransactionCreated,
          amount: decimalKwota));
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
    emit(state.copyWith(status: BankStateEnum.bankStateKwotaChanged, amountFieldValue: inputKwota));
  }

  void completeTransfer() {
    emit(state.copyWith(status: BankStateEnum.bankStateTransferCompleted, amountFieldValue: null));
  }

  void setBlikConfirmed(value) {
    emit(state.copyWith(status: BankStateEnum.bankStateBlikConfirmed));
  }

  Future<void> confirmBlik() async {
    emit(state.copyWith(status: BankStateEnum.bankStateBlikConfirmed, blikNumber: null, blikAmount: null));
  }
}
