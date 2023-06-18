part of 'bank_login_cubit.dart';

enum BankLoginStateEnum {
  initial,
  error,
  loading,
  success,
  pinSuccess,
  pinError,
}

class BankLoginState extends Equatable {
  final BankLoginStateEnum status;
  final int? id;
  final String? login;
  final String? password;
  final String? error;
  final String? pin;
  final String? fullName;

  const BankLoginState({
    required this.status,
    this.id,
    this.login,
    this.password,
    this.error,
    this.pin,
    this.fullName,
  });


  factory BankLoginState.initial() {
    return const BankLoginState(
      status: BankLoginStateEnum.initial,
    );
  }

  @override
  List<Object?> get props =>
      [status, id, login, password, error, pin, fullName,];

  BankLoginState copyWith({
    BankLoginStateEnum? status,
    int? id,
    String? login,
    String? password,
    String? error,
    String? pin,
    String? fullName,
  }) {
    return BankLoginState(
      status: status ?? this.status,
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      error: error ?? this.error,
      pin: pin ?? this.pin,
      fullName: fullName ?? this.fullName,
    );
  }
}
