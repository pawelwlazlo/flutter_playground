import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class BankTransfer extends Equatable {
  final String transferId;
  final String accountHolderName;
  final String title;
  final DateTime accountingDate;
  final DateTime transferDate;
  final String accountNumber;
  final int bankId;
  final Decimal amount;

  @override
  List<Object> get props =>
      [
        transferId,
        accountHolderName,
        title,
        accountingDate,
        transferDate,
        accountNumber,
        bankId,
        amount,
      ];

//<editor-fold desc="Data Methods">
  const BankTransfer({
    required this.transferId,
    required this.accountHolderName,
    required this.title,
    required this.accountingDate,
    required this.transferDate,
    required this.accountNumber,
    required this.bankId,
    required this.amount,
  });


  @override
  String toString() {
    return 'BankTransfer{ transferId: $transferId, accountHolderName: $accountHolderName, title: $title, accountingDate: $accountingDate, transferDate: $transferDate, accountNumber: $accountNumber, bankId: $bankId, amount: $amount,}';
  }

  BankTransfer copyWith({
    String? transferId,
    String? accountHolderName,
    String? title,
    DateTime? accountingDate,
    DateTime? transferDate,
    String? accountNumber,
    int? bankId,
    Decimal? amount,
  }) {
    return BankTransfer(
      transferId: transferId ?? this.transferId,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      title: title ?? this.title,
      accountingDate: accountingDate ?? this.accountingDate,
      transferDate: transferDate ?? this.transferDate,
      accountNumber: accountNumber ?? this.accountNumber,
      bankId: bankId ?? this.bankId,
      amount: amount ?? this.amount,
    );
  }
//</editor-fold>
}

