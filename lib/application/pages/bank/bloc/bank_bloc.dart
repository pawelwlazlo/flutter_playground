import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  BankBloc() : super(BankInitial()) {
    on<BlikRequestedEvent>((event, emit) async {
      emit(BankStateBlikRequested());
      debugPrint('Otrzymano zapytanie o BLIK');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('Otrzymano kod blik');
      emit(BankStateBlikReceived(blikNumber: 123456));
    });
    on<PrzelewRequestedEvent>((event, emit) async {
      emit(BankStatePrzelewRequested());
      debugPrint('Zlecono przelew');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('Otrzymano kod blik');
      emit(BankStatePrzelewSended(kwota: 123));
    });
  }
}
