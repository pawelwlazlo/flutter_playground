part of 'bank_login_cubit.dart';

enum BankLoginStateEnum {
  initial,
  error,
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
}

/*
class BankLoginInitial extends BankLoginState {
  const BankLoginInitial({required super.bankLoginStateModel});

  @override
  List<Object> get props => [];
}

class BankLoginError extends BankLoginState {
  const BankLoginError({required BankLoginStateModel newStateModel})
      : super(bankLoginStateModel: newStateModel);

  @override
  List<Object?> get props => [...super.props, bankLoginStateModel];
}

class BankLoginSuccess extends BankLoginState {
  const BankLoginSuccess({required BankLoginStateModel newStateModel})
      : super(bankLoginStateModel: newStateModel);

  @override
  List<Object?> get props => [...super.props, bankLoginStateModel];
}

class BankPinSuccess extends BankLoginState {
  const BankPinSuccess({required BankLoginStateModel newStateModel})
      : super(bankLoginStateModel: newStateModel);

  @override
  List<Object?> get props => [...super.props, bankLoginStateModel];
}

class BankPinError extends BankLoginState {
  const BankPinError({required BankLoginStateModel newStateModel})
      : super(bankLoginStateModel: newStateModel);

  @override
  List<Object?> get props => [...super.props, bankLoginStateModel];
}
*/
