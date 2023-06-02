import 'dart:ui';

import 'package:equatable/equatable.dart';

class Bank extends Equatable {
  final String name;
  final String logoUrl;
  final Color backgroundColor;

  const Bank({required this.name, required this.logoUrl, required this.backgroundColor});

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      name: map['name'],
      backgroundColor: Color(map['backgroundColor']),
      logoUrl: map['logoUrl'],
    );
  }

  @override
  List<Object?> get props => [name, backgroundColor, logoUrl];
}

class BankAccount extends Equatable {
  final Bank bank;
  final String accountNumber;
  final String cardNumber;
  final double balance;

  const BankAccount({required this.bank, required this.accountNumber, required this.cardNumber, required this.balance});

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(bank: Bank.fromMap(map['bank']),
        accountNumber: map['accountNumber'],
        cardNumber: map['cardNumber'],
        balance: map['balance']);
  }

  @override
  List<Object?> get props => [bank, accountNumber, cardNumber, balance];
}
