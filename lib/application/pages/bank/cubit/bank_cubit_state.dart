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
  BankInitial.initial() : super(bankStateModel: BankStateModel.initial());
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
