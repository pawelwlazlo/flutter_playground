import 'package:equatable/equatable.dart';

//Model holding the state of the BankLoginCubit
class BankLoginStateModel extends Equatable {
  final int? id;
  final String? login;
  final String? password;
  final bool? isLoginButtonEnabled;
  final String? error;
  final String? pin;
  final String? fullName;

  const BankLoginStateModel({
    this.id,
    this.login,
    this.password,
    this.isLoginButtonEnabled,
    this.error,
    this.pin,
    this.fullName,
  });

  BankLoginStateModel copyWith({
    int? id,
    String? login,
    String? password,
    bool? isLoginButtonEnabled,
    String? error,
    String? pin,
    String? fullName,
  }) {
    return BankLoginStateModel(
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      error: error ?? this.error,
      pin: pin ?? this.pin,
      fullName: fullName ?? this.fullName,
    );
  }

  @override
  List<Object?> get props =>
      [id, login, password, isLoginButtonEnabled, error, pin, fullName,];
}
