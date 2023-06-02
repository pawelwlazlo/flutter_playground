import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  BankBloc() : super(BankInitial()) {
    on<BankEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
