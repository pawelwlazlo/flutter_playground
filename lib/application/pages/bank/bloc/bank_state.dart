part of 'bank_bloc.dart';

@immutable
abstract class BankState {}

class BankInitial extends BankState {}

class BankStateBlikRequested extends BankState {}
class BankStatePrzelewRequested extends BankState {}

class BankStateBlikReceived extends BankState {
  final int blikNumber;

  BankStateBlikReceived({required this.blikNumber});
}

class BankStatePrzelewSended extends BankState {
  final int kwota;

  BankStatePrzelewSended({required this.kwota});
}

class BankStateBlikError extends BankState {
  final BankError error;

  BankStateBlikError(this.error);
}

