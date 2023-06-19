import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playground/domain/bank/entities/bank_account.dart';

class BankTransferStateModel extends Equatable {
  final String transferId;
  final String? accountHolderName;
  final String? title;
  final DateTime? accountingDate;
  final DateTime transferDate;
  final String? accountNumber;
  final Decimal amount;
  final BankAccount fromAccount;
  final String recipientAddress;

  const BankTransferStateModel({
    required this.transferId,
    this.accountHolderName,
    this.title,
    this.accountingDate,
    required this.transferDate,
    this.accountNumber,
    required this.amount,
    required this.fromAccount,
    this.recipientAddress = '',
  });

  BankTransferStateModel copyWith({
    String? transferId,
    String? accountHolderName,
    String? title,
    DateTime? accountingDate,
    DateTime? transferDate,
    String? accountNumber,
    Decimal? amount,
    BankAccount? fromAccount,
    String? recipientAddress,
  }) {
    return BankTransferStateModel(
      transferId: transferId ?? this.transferId,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      title: title ?? this.title,
      accountingDate: accountingDate ?? this.accountingDate,
      transferDate: transferDate ?? this.transferDate,
      accountNumber: accountNumber ?? this.accountNumber,
      amount: amount ?? this.amount,
      fromAccount: fromAccount ?? this.fromAccount,
      recipientAddress: recipientAddress ?? this.recipientAddress,
    );
  }

  @override
  List<Object?> get props =>
      [
        transferId,
        accountHolderName,
        title,
        accountingDate,
        transferDate,
        accountNumber,
        amount,
        fromAccount,
        recipientAddress
      ];
}
