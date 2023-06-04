import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../../domain/bank/entities/bank_account.dart';

class BankModel extends Equatable {
  final String name;
  final String logoUrl;
  final int backgroundColor;

  const BankModel({required this.name, required this.logoUrl, required this.backgroundColor});

  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      name: map['name'],
      backgroundColor: map['backgroundColor'],
      logoUrl: map['logoUrl'],
    );
  }

   Bank toBank(BankModel bankModel) {
    return Bank(name: bankModel.name, backgroundColor: Color(bankModel.backgroundColor), logoUrl: bankModel.logoUrl);
  }

  @override
  List<Object?> get props => [name, backgroundColor, logoUrl];
}

class BankAccountModel extends Equatable {
  final BankModel bank;
  final String accountNumber;
  final String cardNumber;
  final double balance;

  @override
  List<Object?> get props => [bank, accountNumber, cardNumber, balance];

  const BankAccountModel({required this.bank, required this.accountNumber, required this.cardNumber, required this.balance});

  factory BankAccountModel.fromMap(Map<String, dynamic> map) {
    return BankAccountModel(bank: BankModel.fromMap(map['bank']),
        accountNumber: map['accountNumber'],
        cardNumber: map['cardNumber'],
        balance: map['balance']);
  }
  BankAccount toBankAccount(BankAccountModel bankAccountModel) {
    return BankAccount(bank: bankAccountModel.bank.toBank(bankAccountModel.bank), accountNumber: bankAccountModel.accountNumber, cardNumber: bankAccountModel.cardNumber, balance: bankAccountModel.balance);
  }
}
