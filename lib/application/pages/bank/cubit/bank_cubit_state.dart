part of 'bank_cubit.dart';

enum BankStateEnum {
  initial,
  bankListLoaded,
  bankLoggedIn,
  bankStateBlikRequested,
  bankStateBlikReceived,
  bankStateTransactionCreated,
  bankPageChanged,
  bankStateCommandPageChanged,
  bankStateKwotaChanged, bankStateTransferCompleted, transactionEnded, bankStateBlikExpired, bankStateBlikServiceRequested, bankStateBlikConfirmed,
}


class BankCubitState extends Equatable {
  final BankStateEnum status;
  final int? userId;
  final String? login;
  final List<BankAccount> bankAccounts;
  final BankAccount? activeBank;
  final int? blikNumber;
  final String? amountFieldValue;
  final Failure? failure;
  final String? fullName;
  final int? activeCommand;
  final Decimal? amount;
  final Decimal? blikAmount;

  const BankCubitState({
    required this.status,
    this.userId,
    this.login,
    required this.bankAccounts,
    this.activeBank,
    this.blikNumber,
    this.amountFieldValue,
    this.failure,
    this.fullName,
    this.activeCommand,
    required this.amount,
    this.blikAmount,
  });

  factory BankCubitState.initial() {
    return const BankCubitState(
      status: BankStateEnum.initial,
      userId: null,
      login: null,
      bankAccounts: [],
      activeBank: null,
      blikNumber: null,
      amountFieldValue: null,
      failure: null,
      fullName: null,
      activeCommand: null,
      amount: null,
      blikAmount: null,
    );
  }

  BankCubitState copyWith({
    BankStateEnum? status,
    int? userId,
    String? login,
    List<BankAccount>? bankAccounts,
    BankAccount? activeBank,
    int? blikNumber,
    String? amountFieldValue,
    Failure? failure,
    String? fullName,
    int? activeCommand,
    Decimal? amount,
    Decimal? blikAmount,
  }) {
    return BankCubitState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      login: login ?? this.login,
      bankAccounts: bankAccounts ?? this.bankAccounts,
      activeBank: activeBank ?? this.activeBank,
      blikNumber: blikNumber ?? this.blikNumber,
      amountFieldValue: amountFieldValue ?? this.amountFieldValue,
      failure: failure ?? this.failure,
      fullName: fullName ?? this.fullName,
      activeCommand: activeCommand ?? this.activeCommand,
      amount: amount ?? this.amount,
      blikAmount: blikAmount ?? this.blikAmount,
    );
  }

  @override
  List<Object?> get props =>
      [
        status,
        userId,
        login,
        bankAccounts,
        activeBank,
        blikNumber,
        amountFieldValue,
        failure,
        fullName,
        activeCommand,
        amount,
      ];
}
