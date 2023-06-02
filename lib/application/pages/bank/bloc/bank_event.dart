part of 'bank_bloc.dart';

@immutable
abstract class BankEvent {}

class BlikRequestedEvent extends BankEvent {}