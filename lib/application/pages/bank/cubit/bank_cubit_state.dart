part of 'bank_cubit.dart';

abstract class BankCubitState extends Equatable {
  final BankStateModel bankStateModel;

  const BankCubitState({
    required this.bankStateModel,
  });

  @override
  List<Object?> get props => [bankStateModel];
}

class BankInitial extends BankCubitState {
  BankInitial(
  ) : super(bankStateModel: BankStateModel.initial());
}

class BankLoggedIn extends BankCubitState {
  const BankLoggedIn({
    required BankStateModel newModel,
  }) : super(bankStateModel: newModel);

  @override
  List<Object> get props => [bankStateModel];
}


class BankListLoaded extends BankCubitState {
  const BankListLoaded({
    required BankStateModel newModel,
  }) : super(bankStateModel: newModel);

  @override
  List<Object?> get props => [...super.props, bankStateModel.bankAccounts];
}

class BankStateBlikRequested extends BankCubitState {
  const BankStateBlikRequested({required BankStateModel newModel})
      : super(bankStateModel: newModel);
}

class BankStatePrzelewRequested extends BankCubitState {
  const BankStatePrzelewRequested({required BankStateModel newModel})
      : super(bankStateModel: newModel);
}

class BankStateBlikReceived extends BankCubitState {
  const BankStateBlikReceived({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props => [...super.props, bankStateModel.blikNumber];
}

class BankStatePrzelewSended extends BankCubitState {
  const BankStatePrzelewSended({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props => [...super.props, bankStateModel.kwota];
}

class BankStateError extends BankCubitState {
  const BankStateError({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props => [...super.props, bankStateModel.failure];
}

class BankPageChanged extends BankCubitState {
  const BankPageChanged({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props => [...super.props, bankStateModel.activeBank];
}

class BankStateLoginRequested extends BankCubitState {
  const BankStateLoginRequested({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );
}

class BankStateLoginSuccess extends BankCubitState {
  const BankStateLoginSuccess({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props =>
      [
        ...super.props,
        bankStateModel.login,
        bankStateModel.fullName,
      ];
}

class BankStateCommandPageChanged extends BankCubitState {
  const BankStateCommandPageChanged({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props =>
      [
        ...super.props,
        bankStateModel.activeCommand,
      ];
}

class BankStateKwotaChanged extends BankCubitState {
  const BankStateKwotaChanged({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props =>
      [
        ...super.props,
        bankStateModel.kwota,
      ];
}

class BankStateTransactionCreated extends BankCubitState {
  const BankStateTransactionCreated({
    required BankStateModel newModel,
  }) : super(
    bankStateModel: newModel,
  );

  @override
  List<Object?> get props =>
      [
        ...super.props,
        bankStateModel.kwota,
      ];
}