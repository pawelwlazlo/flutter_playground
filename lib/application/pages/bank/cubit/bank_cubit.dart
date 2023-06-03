import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bank/entity/bank_error.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  BankCubit() : super(BankInitial());
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
}
