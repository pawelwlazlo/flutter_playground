import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bank_login_state.dart';

class BankLoginCubit extends Cubit<BankLoginState> {
  BankLoginCubit() : super(BankLoginState.initial());

  void logIn(String login, String password) {
    if (login == 'a' && password == 'a') {
      emit(state.copyWith(
        status: BankLoginStateEnum.success,
        id: 1,
        login: login,
        password: password,
        error: null,
      ));
    } else {
      emit(state.copyWith(
        status: BankLoginStateEnum.error,
        id: null,
        login: null,
        password: null,
        error: 'Invalid credentials',
      ));
    }
  }

  void submitPin(String pin) {
    if (pin == '1') {
      emit(state.copyWith(
        status: BankLoginStateEnum.pinSuccess,
        pin: pin,
        fullName: 'John Doe',
        error: null,
      ));
    } else {
      emit(state.copyWith(
        status: BankLoginStateEnum.pinError,
        pin: null,
        fullName: null,
        error: 'Invalid pin',
      ));
    }
  }
}
