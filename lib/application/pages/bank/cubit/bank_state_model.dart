import 'package:decimal/decimal.dart';

import '../../../../domain/bank/entities/bank_account.dart';
import '../../../../domain/core/failure.dart';

class BankStateModel {
  final List<BankAccount> bankAccounts;
  final BankAccount? activeBank;
  final int? blikNumber;
  final Decimal? kwota;
  final Failure? failure;
  final String? login;
  final String? fullName;

  BankStateModel({
    required this.bankAccounts,
    required this.activeBank,
    this.blikNumber,
    this.kwota,
    this.failure,
    this.login,
    this.fullName,
  });

  factory BankStateModel.initial() {
    return BankStateModel(
      bankAccounts: [],
      activeBank: null,
    );
  }

  BankStateModel copyWith({
    List<BankAccount>? bankAccounts,
    BankAccount? activeBank,
    int? blikNumber,
    Decimal? kwota,
    Failure? failure,
    String? login,
    String? fullName,
  }) {
    return BankStateModel(
      bankAccounts: bankAccounts ?? this.bankAccounts,
      activeBank: activeBank ?? this.activeBank,
      blikNumber: blikNumber ?? this.blikNumber,
      kwota: kwota ?? this.kwota,
      failure: failure ?? this.failure,
      login: login ?? this.login,
      fullName: fullName ?? this.fullName,
    );
  }
}
