import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/domain/login/entities/user.dart';

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
    if(login.isEmpty || password.isEmpty) {
      emit(state.copyWith(
        status: BankLoginStateEnum.error,
        id: null,
        login: login,
        password: password,
        fullName: null,
        pin: null,
        error: 'Invalid credentials',
      ));
      return;
    }
    getUserUseCase.call(login: login, password: password).then((value) {
      value.fold(
        (failure) => emit(state.copyWith(
          status: BankLoginStateEnum.error,
          id: null,
          login: login,
          password: password,
          fullName: null,
          pin: null,
          error: failure.message,
        )),
        (user) => emit(state.copyWith(
          status: BankLoginStateEnum.success,
          id: user.id,
          login: user.login,
          password: user.password,
          fullName: user.fullName,
          pin: user.pin,
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

  void submitPin(String pin) async {
    final result = await checkUserPinUseCase.execute(pin: pin, user: User(id: state.id!,
        login: state.login!,
        fullName: state.fullName!,
        password: state.password!,
        pin: state.pin!));
    if (result) {
      emit(state.copyWith(
        status: BankLoginStateEnum.pinSuccess,
        pin: pin,
        error: null,
      ));
    } else {
      emit(state.copyWith(
        status: BankLoginStateEnum.pinError,
        error: 'Invalid pin',
      ));
    }
  }
}
