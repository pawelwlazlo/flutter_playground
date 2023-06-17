import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bank_transfer_state.dart';

class BankTransferCubit extends Cubit<BankTransferState> {
  BankTransferCubit() : super(BankTransferInitial());
}
