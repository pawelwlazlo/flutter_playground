import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_state_model.dart';
import 'package:uuid/uuid.dart';

part 'bank_transfer_state.dart';

class BankTransferCubit extends Cubit<BankTransferState> {
  final BankCubit bankCubit;
  late StreamSubscription bankCubitSubscription;

  BankTransferCubit({required this.bankCubit})
      : super(BankTransferState.initial()) {
    bankCubitSubscription = bankCubit.stream.listen((state) {
      if (state.status == BankStateEnum.bankStateTransactionCreated) {
        addTransaction(BankTransferStateModel(
          transferId: const Uuid().v4(),
          amount: state.kwota!,
          fromAccount: state.activeBank!,
          transferDate: DateTime.now(),
        ));
      }
    });
  }

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

  @override
  Future<void> close() {
    bankCubitSubscription.cancel();
    return super.close();
  }
}
