import 'package:equatable/equatable.dart';

//Model holding the state of the BankLoginCubit
class BankLoginStateModel extends Equatable {
  final String? login;
  final String? password;
  final bool? isLoginButtonEnabled;
  final String? error;
  final String? pin;

  const BankLoginStateModel({
    this.login,
    this.password,
    this.isLoginButtonEnabled,
    this.error,
    this.pin,
  });

  @override
  List<Object?> get props => [
        login,
        password,
        isLoginButtonEnabled,
        error,
        pin,
      ];
}
