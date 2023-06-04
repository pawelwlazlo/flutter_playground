part of 'bank_cubit.dart';

abstract class BankCubitState extends Equatable {
  const BankCubitState();

  @override
  List<Object?> get props => [];
}

class BankInitial extends BankCubitState {}

class BankStateBlikRequested extends BankCubitState {}

class BankStatePrzelewRequested extends BankCubitState {}

class BankStateBlikReceived extends BankCubitState {
  final int blikNumber;

  const BankStateBlikReceived({required this.blikNumber});

  @override
  List<Object?> get props => [blikNumber];
}

class BankStatePrzelewSended extends BankCubitState {
  final int kwota;

  const BankStatePrzelewSended({required this.kwota});
  @override
  List<Object?> get props => [kwota];
}

class BankStateError extends BankCubitState {
  final Failure failure;

  const BankStateError({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class BankListLoaded extends BankCubitState {
  final List<BankAccount> bankAccounts;

  const BankListLoaded({required this.bankAccounts});

  @override
  List<Object?> get props => [bankAccounts];
}

class BankPageChanged extends BankCubitState {
  final int index;

  const BankPageChanged({required this.index});

  @override
  List<Object?> get props => [index];
}
