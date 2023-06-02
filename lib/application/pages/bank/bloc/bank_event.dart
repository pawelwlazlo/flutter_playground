part of 'bank_bloc.dart';

@immutable
abstract class BankEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BlikRequestedEvent extends BankEvent {}
class PrzelewRequestedEvent extends BankEvent {}
class BlikNaTelefonRequestedEvent extends BankEvent {}
