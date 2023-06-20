import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_state_model.dart';
import 'package:formz/formz.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/bank/entities/bank_account.dart';

part 'bank_transfer_state.dart';

class BankTransferCubit extends Cubit<BankTransferState> {

  BankTransferCubit()
      : super(BankTransferState.initial());



  void addTransaction(BankTransferStateModel transaction) {
    emit(state.copyWith(
      transactions: [...state.transactions, transaction],
    ));
    debugPrint('Transactions: ${state.transactions}');
  }

  void removeTransaction(BankTransferStateModel transaction) {
    emit(state.copyWith(
      transactions: state.transactions
          .where((element) => element != transaction)
          .toList(),
    ));
  }

  void clearTransactions() {
    emit(state.copyWith(
      transactions: [],
    ));
  }

  void setAccountHolderName(String accountHolderName) {
    final accountHolderNameInput = RecipientName.dirty(accountHolderName);

    emit(state.copyWith(
      formzStatus: Formz.validate([
        state.accountNumber,
        state.title,
        accountHolderNameInput,
        state.recipientAddress,
      ]),
      recipientName: accountHolderNameInput.isValid
          ? RecipientName.pure(accountHolderName)
          : accountHolderNameInput,
    ));
  }

  void setTitle(String title) {
    final titleInput = Title.dirty(title);
    emit(state.copyWith(
      formzStatus: Formz.validate([
        state.accountNumber,
        titleInput,
        state.recipientName,
        state.recipientAddress,
      ]),
      title: titleInput.isValid ? Title.pure(title) : titleInput,
    ));
  }

  void setRecipientAccountNumber(String accountNumber) {
    final recipientAccountNumberInput = AccountNumber.dirty(accountNumber);
    emit(state.copyWith(
      formzStatus: Formz.validate([
        recipientAccountNumberInput,
        state.title,
        state.recipientName,
        state.recipientAddress,
      ]),
      accountNumber: recipientAccountNumberInput.isValid
          ? AccountNumber.pure(accountNumber)
          : recipientAccountNumberInput,
    ));
  }

  void setRecipientAddress(String recipientAddress) {
    final recipientAddressInput = RecipientAddress.dirty(recipientAddress);
    emit(state.copyWith(
      formzStatus: Formz.validate([
        state.accountNumber,
        state.title,
        state.recipientName,
        recipientAddressInput,
      ]),
      recipientAddress: recipientAddressInput.isValid
          ? RecipientAddress.pure(recipientAddress)
          : recipientAddressInput,
    ));
  }

  void transfer() async {
    emit(state.copyWith(
      status: BankTransferStateEnum.bankTransferStateTransferInProgress,
    ));
    final BankTransferStateModel transaction = BankTransferStateModel(
      transferId: const Uuid().v4(),
      amount: state.amount!,
      fromAccount: state.fromAccount!,
      transferDate: DateTime.now(),
      title: state.title.value,
      accountHolderName: state.recipientName.value,
      recipientAddress: state.recipientAddress.value,
    );
    addTransaction(transaction);
    await Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(
        status: BankTransferStateEnum.bankTransferStateTransferInProgress,
      ));
    });
    await Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(
        status: BankTransferStateEnum.bankTransferStateTransferCompleted,

      ));
    });
  }

  void setKwota(Decimal kwota) {
    emit(state.copyWith(
      amount: kwota,
    ));
  }

  void setFromAccount(BankAccount bankAccount) {
    emit(state.copyWith(
      fromAccount: bankAccount,
    ));
  }

  void completeTransfer() {
    emit(state.copyWith(
      status: BankTransferStateEnum.bankTransferStateTransferEnded,
      title: const Title.pure(''),
      accountNumber: const AccountNumber.pure(''),
      recipientAddress: const RecipientAddress.pure(''),
      recipientName: const RecipientName.pure(''),
    ));
  }
}
