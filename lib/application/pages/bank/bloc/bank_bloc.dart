import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  BankBloc() : super(BankInitial()) {
    on<BankEvent>((event, emit) {

    });
  }
}
