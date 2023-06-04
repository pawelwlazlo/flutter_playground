import 'package:decimal/decimal.dart';

import '../../../../domain/bank/entities/bank_account.dart';
import '../../../../domain/core/failure.dart';

class BankStateModel {
  final List<BankAccount> bankAccounts;
  final BankAccount activeBank;
  final int? blikNumber;
  final Decimal? kwota;
  final Failure? failure;

  BankStateModel({
    required this.bankAccounts,
    required this.activeBank,
    this.blikNumber,
    this.kwota,
    this.failure,
  });

  BankStateModel copyWith({
    List<BankAccount>? bankAccounts,
    BankAccount? activeBank,
    int? blikNumber,
    Decimal? kwota,
    Failure? failure,
  }) {
    return BankStateModel(
      bankAccounts: bankAccounts ?? this.bankAccounts,
      activeBank: activeBank ?? this.activeBank,
      blikNumber: blikNumber ?? this.blikNumber,
      kwota: kwota ?? this.kwota,
      failure: failure ?? this.failure,
    );
  }
}
