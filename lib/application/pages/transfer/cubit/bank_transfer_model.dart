import 'package:equatable/equatable.dart';

class BankTransfer extends Equatable {
  final String? title;
  final String? description;
  final String? amount;
  final String? recipient;

  const BankTransfer({
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
    return BankTransfer(
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      recipient: recipient ?? this.recipient,
    );
  }
}
