part of 'bank_bloc.dart';

@immutable
abstract class BankState {}

class BankInitial extends BankState {}

class BankStateBlikRequested extends BankState {}

class BankStateBlikReceived extends BankState {
  final int blikNumber;

  BankStateBlikReceived({required this.blikNumber});
}

class BankStateBlikError extends BankState {
  final BankError error;

  BankStateBlikError(this.error);
}

