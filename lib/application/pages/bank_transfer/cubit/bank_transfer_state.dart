part of 'bank_transfer_cubit.dart';

class BankTransferState extends Equatable {
  final List<BankTransferStateModel> transactions;

  const BankTransferState({
    required this.transactions,
  });

  factory BankTransferState.initial() {
    return const BankTransferState(
      transactions: [],
    );
  }

  @override
  List<Object> get props => [transactions];

  BankTransferState copyWith({
    List<BankTransferStateModel>? transactions,
  }) {
    return BankTransferState(
      transactions: transactions ?? this.transactions,
    );
  }
}
