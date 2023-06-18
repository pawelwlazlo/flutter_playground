import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';

import '../../../../domain/bank/entities/bank_account.dart';
import '../../../../domain/core/failure.dart';

class BankStateModel extends Equatable {
  final int? userId;
  final String? login;
  final List<BankAccount> bankAccounts;
  final BankAccount? activeBank;
  final int? blikNumber;
  final Decimal? kwota;
  final Failure? failure;
  final String? fullName;
  final int? activeCommand;

  const BankStateModel({
    this.userId,
    this.login,
    required this.bankAccounts,
    this.activeBank,
    this.blikNumber,
    this.kwota,
    this.failure,
    this.fullName,
    this.activeCommand,
  });


   factory BankStateModel.initial() {
    return const BankStateModel(
      userId: null,
      login: null,
      bankAccounts: [],
      activeBank: null,
      blikNumber: null,
      kwota: null,
      failure: null,
      fullName: null,
      activeCommand: null,
    );
  }


  @override
  List<Object?> get props =>
      [
        userId,
        login,
        bankAccounts,
        activeBank,
        blikNumber,
        kwota,
        failure,
        fullName,
        activeCommand,
      ];

  BankStateModel copyWith({
    int? userId,
    String? login,
    List<BankAccount>? bankAccounts,
    BankAccount? activeBank,
    int? blikNumber,
    Decimal? kwota,
    Failure? failure,
    String? fullName,
    int? activeCommand,
  }) {
    return BankStateModel(
      userId: userId ?? this.userId,
      login: login ?? this.login,
      bankAccounts: bankAccounts ?? this.bankAccounts,
      activeBank: activeBank ?? this.activeBank,
      blikNumber: blikNumber ?? this.blikNumber,
      kwota: kwota ?? this.kwota,
      failure: failure ?? this.failure,
      fullName: fullName ?? this.fullName,
      activeCommand: activeCommand ?? this.activeCommand,
    );
  }

}
