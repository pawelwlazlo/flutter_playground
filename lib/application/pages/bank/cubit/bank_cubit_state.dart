part of 'bank_cubit.dart';

abstract class BankCubitState extends Equatable {
  final List<BankAccount> bankAccounts;
  final BankAccount? activeBank;
  const BankCubitState.initial()
      : bankAccounts = const [],
        activeBank = null;

  const BankCubitState({
    required this.bankAccounts,
    this.activeBank,
  });

  @override
  List<Object?> get props => [bankAccounts, activeBank];
}

class BankInitial extends BankCubitState {
  const BankInitial.initial() : super.initial();
}

class BankStateBlikRequested extends BankListLoaded {
  const BankStateBlikRequested(
      {required super.bankAccounts, required super.activeBank});
}

class BankStatePrzelewRequested extends BankCubitState {
  const BankStatePrzelewRequested(
      {required super.bankAccounts, required super.activeBank});
}

class BankStateBlikReceived extends BankListLoaded {
  final int blikNumber;

  const BankStateBlikReceived({
    required this.blikNumber,
    required List<BankAccount> bankAccounts,
    BankAccount? activeBank,
  }) : super(
          bankAccounts: bankAccounts,
          activeBank: activeBank,
        );

  @override
  List<Object?> get props => [...super.props, blikNumber];
}

class BankStatePrzelewSended extends BankCubitState {
  final int kwota;

  const BankStatePrzelewSended({
    required this.kwota,
    required List<BankAccount> bankAccounts,
    BankAccount? activeBank,
  }) : super(
          bankAccounts: bankAccounts,
          activeBank: activeBank,
        );

  @override
  List<Object?> get props => [...super.props, kwota];
}

class BankStateError extends BankCubitState {
  final Failure failure;

  const BankStateError({
    required this.failure,
    required List<BankAccount> bankAccounts,
    BankAccount? activeBank,
  }) : super(
          bankAccounts: bankAccounts,
          activeBank: activeBank,
        );

  @override
  List<Object?> get props => [...super.props, failure];
}

class BankListLoaded extends BankCubitState {
  const BankListLoaded({
    required super.bankAccounts,
    required super.activeBank,
  });

  @override
  List<Object?> get props => [...super.props, bankAccounts];
}

class BankPageChanged extends BankCubitState {
  final int index;

  BankPageChanged({
    required this.index,
    required List<BankAccount> bankAccounts,
    BankAccount? activeBank,
  }) : super(
          bankAccounts: bankAccounts,
          activeBank: bankAccounts.isNotEmpty ? bankAccounts[index] : null,
        );

  @override
  List<Object?> get props => [...super.props, index];
}
