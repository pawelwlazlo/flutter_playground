part of 'bank_cubit.dart';

enum BankStateEnum {
  initial,
  bankListLoaded,
  bankLoggedIn,
  bankStateBlikRequested,
  bankStateBlikReceived,
  bankStateTransactionCreated,
  bankPageChanged,
  bankStateCommandPageChanged, bankStateKwotaChanged,
}


class BankCubitState extends Equatable {
  final BankStateEnum status;
  final int? userId;
  final String? login;
  final List<BankAccount> bankAccounts;
  final BankAccount? activeBank;
  final int? blikNumber;
  final Decimal? kwota;
  final Failure? failure;
  final String? fullName;
  final int? activeCommand;

  const BankCubitState({
    required this.status,
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

  factory BankCubitState.initial() {
    return const BankCubitState(
      status: BankStateEnum.initial,
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

  BankCubitState copyWith({
    BankStateEnum? status,
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
    return BankCubitState(
      status: status ?? this.status,
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

  @override
  List<Object?> get props =>
      [
        status,
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
}
