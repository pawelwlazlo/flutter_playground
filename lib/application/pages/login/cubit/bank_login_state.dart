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
  final bool privateMode;

  const BankLoginState({
    required this.status,
    this.id,
    this.login,
    this.password,
    this.error,
    this.pin,
    this.fullName,
    this.privateMode = false,
  });


  factory BankLoginState.initial() {
    return const BankLoginState(
      status: BankLoginStateEnum.loading,
    );
  }

  @override
  List<Object?> get props =>
      [status, id, login, password, error, pin, fullName, privateMode];

  BankLoginState copyWith({
    BankLoginStateEnum? status,
    int? id,
    String? login,
    String? password,
    String? error,
    String? pin,
    String? fullName,
    bool? privateMode,
  }) {
    return BankLoginState(
      status: status ?? this.status,
      id: id ?? this.id,
      login: login ?? this.login,
      password: password ?? this.password,
      error: error ?? this.error,
      pin: pin ?? this.pin,
      fullName: fullName ?? this.fullName,
      privateMode: privateMode ?? this.privateMode,
    );
  }
}
