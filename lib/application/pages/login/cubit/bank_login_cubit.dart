import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/pages/login/cubit/bank_login_model.dart';

part 'bank_login_state.dart';

class BankLoginCubit extends Cubit<BankLoginState> {
  BankLoginCubit()
      : super(
            const BankLoginInitial(bankLoginStateModel: BankLoginStateModel()));
}
