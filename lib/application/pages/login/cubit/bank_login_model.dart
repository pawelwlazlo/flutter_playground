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

  copyWith({
    String? login,
    String? password,
    bool? isLoginButtonEnabled,
    String? error,
    String? pin,
  }) {
    return BankLoginStateModel(
      login: login ?? this.login,
      password: password ?? this.password,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      error: error ?? this.error,
      pin: pin ?? this.pin,
    );
  }
}
