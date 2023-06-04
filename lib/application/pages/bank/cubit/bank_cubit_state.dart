part of 'bank_cubit.dart';

class BankStateModel {
  final List<BankAccount> bankAccounts;
  final BankAccount? activeBank;
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

abstract class BankCubitState<X> extends Equatable {
  final BankStateModel stateModel;

  const BankCubitState({
    required this.stateModel,
  });

  @override
  List<Object?> get props => [stateModel];

  X copyWith({required BankStateModel newModel});
}

class BankInitial extends BankCubitState<BankInitial> {
  BankInitial()
      : super(stateModel: BankStateModel(bankAccounts: [], activeBank: null));

  @override
  BankInitial copyWith({
    required BankStateModel newModel,
  }) {
    return BankInitial()
      ..stateModel.copyWith(
          bankAccounts: newModel.bankAccounts, activeBank: newModel.activeBank);
  }
}

class BankListLoaded extends BankCubitState {
  const BankListLoaded({
    required BankStateModel stateModel,
  }) : super(stateModel: stateModel);

  @override
  BankListLoaded copyWith({
    required BankStateModel newModel,
  }) {
    return BankListLoaded(
      stateModel: stateModel.copyWith(
        bankAccounts: newModel.bankAccounts,
        activeBank: newModel.activeBank,
      ),
    );
  }

  @override
  List<Object?> get props => [...super.props, stateModel.bankAccounts];
}

class BankStateBlikRequested extends BankCubitState {
  const BankStateBlikRequested({
    required BankStateModel stateModel,
  }) : super(stateModel: stateModel);

  @override
  BankStateBlikRequested copyWith({
    required BankStateModel newModel,
  }) {
    return BankStateBlikRequested(
      stateModel: newModel.copyWith(
        blikNumber: newModel.blikNumber,
      ),
    );
  }
}

class BankStatePrzelewRequested extends BankCubitState {
  const BankStatePrzelewRequested({
    required BankStateModel stateModel,
  }) : super(stateModel: stateModel);

  @override
  BankStatePrzelewRequested copyWith({
    required BankStateModel newModel,
  }) {
    return BankStatePrzelewRequested(
      stateModel: stateModel.copyWith(
        kwota: newModel.kwota,
      ),
    );
  }
}

class BankStateBlikReceived extends BankCubitState {
  const BankStateBlikReceived({
    required BankStateModel stateModel,
  }) : super(stateModel: stateModel);

  @override
  BankStateBlikReceived copyWith({
    required BankStateModel newModel,
  }) {
    return BankStateBlikReceived(
      stateModel: stateModel.copyWith(
        blikNumber: newModel.blikNumber,
      ),
    );
  }
}

class BankStatePrzelewSended extends BankCubitState {
  const BankStatePrzelewSended({required BankStateModel stateModel})
      : super(stateModel: stateModel);

  @override
  BankStatePrzelewSended copyWith({
    required BankStateModel newModel,
  }) {
    return BankStatePrzelewSended(
      stateModel: stateModel.copyWith(
        activeBank: newModel.activeBank,
        kwota: Decimal.zero,
      ),
    );
  }
}

class BankStateError extends BankCubitState {
  const BankStateError({required BankStateModel stateModel})
      : super(stateModel: stateModel);

  @override
  BankStateError copyWith({
    required BankStateModel newModel,
  }) {
    return BankStateError(
      stateModel: stateModel.copyWith(
        failure: newModel.failure,
      ),
    );
  }
}
