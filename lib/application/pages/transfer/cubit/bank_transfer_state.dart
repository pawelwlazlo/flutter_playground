part of 'bank_transfer_cubit.dart';

abstract class BankTransferState extends Equatable {
  const BankTransferState();
}

class BankTransferInitial extends BankTransferState {
  @override
  List<Object> get props => [];
}
