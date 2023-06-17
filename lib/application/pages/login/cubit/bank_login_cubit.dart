import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/login/cubit/bank_login_model.dart';

part 'bank_login_state.dart';

class BankLoginCubit extends Cubit<BankLoginState> {
  BankLoginCubit()
      : super(
            const BankLoginInitial(bankLoginStateModel: BankLoginStateModel()));

  void logIn(String login, String password) {
    debugPrint('login: $login, password: $password');
    if (login == 'admin' && password == 'admin') {
      emit(BankLoginSuccess(
          newStateModel: state.bankLoginStateModel.copyWith(
              id: 1,
              error: null,
              login: login,
              password: password,
              fullName: 'Adam Nowak',
              pin: null)));
    } else {
      emit(BankLoginError(
          newStateModel: state.bankLoginStateModel
              .copyWith(error: 'Nieprawidłowe dane logowania')));
    }
  }

  void submitPin(String pin) {
    debugPrint('pin: $pin');
    if (pin == '1234') {
      emit(BankPinSuccess(
          newStateModel:
              state.bankLoginStateModel.copyWith(error: null, pin: pin)));
    } else {
      emit(BankLoginError(
          newStateModel:
              state.bankLoginStateModel.copyWith(error: 'Invalid pin')));
    }
  }
}
