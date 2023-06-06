part of 'bank_login_cubit.dart';

abstract class BankLoginState extends Equatable {
  final BankLoginStateModel bankLoginStateModel;

  const BankLoginState({required this.bankLoginStateModel});

  @override
  List<Object?> get props => [bankLoginStateModel];
}

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
