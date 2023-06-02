part of 'bank_bloc.dart';

@immutable
abstract class BankState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BankInitial extends BankState {}

class BankStateBlikRequested extends BankState {}
class BankStatePrzelewRequested extends BankState {}

class BankStateBlikReceived extends BankState {
  final int blikNumber;

  BankStateBlikReceived({required this.blikNumber});

  @override
  List<Object?> get props => [blikNumber];
}

class BankStatePrzelewSended extends BankState {
  final int kwota;

  BankStatePrzelewSended({required this.kwota});
  @override
  List<Object?> get props => [kwota];
}

class BankStateBlikError extends BankState {
  final BankError error;

  BankStateBlikError(this.error);
}

