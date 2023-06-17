import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_state_model.dart';

part 'bank_transfer_state.dart';

class BankTransferCubit extends Cubit<BankTransferState> {
  BankTransferCubit() : super(BankTransferState.initial());

  void addTransaction(BankTransferStateModel transaction) {
    emit(state.copyWith(
      transactions: [...state.transactions, transaction],
    ));
  }

  void removeTransaction(BankTransferStateModel transaction) {
    emit(state.copyWith(
      transactions: state.transactions.where((element) => element != transaction).toList(),
    ));
  }

  void clearTransactions() {
    emit(state.copyWith(
      transactions: [],
    ));
  }

}
