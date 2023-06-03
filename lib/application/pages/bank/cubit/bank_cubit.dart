import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/bank/entity/bank_error.dart';

part 'bank_cubit_state.dart';

class BankCubit extends Cubit<BankCubitState> {
  BankCubit() : super(BankInitial());
}
