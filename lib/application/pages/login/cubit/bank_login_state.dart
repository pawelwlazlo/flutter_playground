part of 'bank_login_cubit.dart';

abstract class BankLoginState extends Equatable {
  final BankLoginStateModel bankLoginStateModel;
  const BankLoginState({required this.bankLoginStateModel});
}

class BankLoginInitial extends BankLoginState {
  const BankLoginInitial({required super.bankLoginStateModel});
  @override
  List<Object> get props => [];
}
