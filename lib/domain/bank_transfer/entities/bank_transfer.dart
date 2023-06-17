import 'package:equatable/equatable.dart';

class BankTransfer extends Equatable {
  final int transferId;
  final String accountHolderName;
  final String title;
  final DateTime accountingDate;
  final DateTime transferDate;
  final String accountNumber;
  final int bankId;

  const BankTransfer({
    required this.transferId,
    required this.accountHolderName,
    required this.title,
    required this.accountingDate,
    required this.transferDate,
    required this.accountNumber,
    required this.bankId,
  });

  BankTransfer copyWith({
    int? transferId,
    String? odbiorca,
    String? tytulPrzelewu,
    DateTime? data,
    DateTime? dataKsiegowania,
    String? nrRachunku,
    int? bankId,
  }) {
    return BankTransfer(
      transferId: transferId ?? this.transferId,
      accountHolderName: odbiorca ?? accountHolderName,
      title: tytulPrzelewu ?? title,
      accountingDate: data ?? accountingDate,
      transferDate: dataKsiegowania ?? transferDate,
      accountNumber: nrRachunku ?? accountNumber,
      bankId: bankId ?? this.bankId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transferId': transferId,
      'odbiorca': accountHolderName,
      'tytulPrzelewu': title,
      'data': accountingDate,
      'dataKsiegowania': transferDate,
      'nrRachunku': accountNumber,
      'bankId': bankId,
    };
  }

  factory BankTransfer.fromMap(Map<String, dynamic> map) {
    return BankTransfer(
      transferId: map['transferId'] as int,
      accountHolderName: map['odbiorca'] as String,
      title: map['tytulPrzelewu'] as String,
      accountingDate: map['data'] as DateTime,
      transferDate: map['dataKsiegowania'] as DateTime,
      accountNumber: map['nrRachunku'] as String,
      bankId: map['bankId'] as int,
    );
  }

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
      ];

}

