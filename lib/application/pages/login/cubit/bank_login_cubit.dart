import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/login/usecases/check_user_pin_use_case.dart';
import '../../../../domain/login/usecases/get_user_use_case.dart';

part 'bank_login_state.dart';

class BankLoginCubit extends Cubit<BankLoginState> {
  final GetUserUseCase getUserUseCase;
  final CheckUserPinUseCase checkUserPinUseCase;

  BankLoginCubit({
    required this.getUserUseCase,
    required this.checkUserPinUseCase,
}) : super(BankLoginState.initial());

  void logIn(String login, String password) async {
    getUserUseCase.call(login: login, password: password).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
          status: BankLoginStateEnum.error,
          id: null,
          login: null,
          password: null,
          error: failure.message,
        )),
        (user) => emit(state.copyWith(
          status: BankLoginStateEnum.success,
          id: user.id,
          login: user.login,
          password: user.password,
          error: null,
        )),
      );
    });
/*
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
*/
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
