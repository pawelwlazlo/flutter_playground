part of 'bank_bloc.dart';

@immutable
abstract class BankEvent {}

class BlikRequestedEvent extends BankEvent {}
class PrzelewRequestedEvent extends BankEvent {}
class BlikNaTelefonRequestedEvent extends BankEvent {}
