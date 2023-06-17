import 'package:equatable/equatable.dart';

class BankTransferStateModel extends Equatable {
  final String? title;
  final String? description;
  final String? amount;
  final String? recipient;

  const BankTransferStateModel({
    this.title,
    this.description,
    this.amount,
    this.recipient,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        amount,
        recipient,
      ];

  copyWith({
    String? title,
    String? description,
    String? amount,
    String? recipient,
  }) {
    return BankTransferStateModel(
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      recipient: recipient ?? this.recipient,
    );
  }
}
