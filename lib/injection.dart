import 'package:flutter_playground/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';
import 'package:flutter_playground/application/pages/login/cubit/bank_login_cubit.dart';
import 'package:flutter_playground/data/bank/datasources/bank_data_source.dart';
import 'package:flutter_playground/data/bank/repositiories/bank_account_repository_impl.dart';
import 'package:flutter_playground/data/bank/repositiories/bank_transfer_repository_impl.dart';
import 'package:flutter_playground/domain/bank/repositories/bank_account_repository.dart';
import 'package:flutter_playground/domain/bank/usecases/get_bank_accounts_use_case.dart';
import 'package:flutter_playground/domain/bank_transfer/repositories/bank_transfer_repository.dart';
import 'package:flutter_playground/domain/bank_transfer/usecases/get_transfers_use_case.dart';
import 'package:get_it/get_it.dart';

import 'application/pages/bank/cubit/bank_cubit.dart';
import 'data/bank/datasources/bank_transfer_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
// ! application Layer
// ! Blocs
/*
  sl.registerFactory(() => BankCubit(sl()));
  sl.registerFactory(() => BankLoginCubit());
  sl.registerFactory(() => BankTransferCubit(bankCubit: sl()));
*/

// ! Domain Layer
//
// ! Use Cases
  sl.registerFactory(() => GetBankAccountsUseCase(sl()));
  sl.registerFactory(() => GetBankTransfersUseCase(sl()));

// ! Repositories
  sl.registerFactory<BankAccountRepository>(
      () => BankAccountRepositoryImpl(bankAccountDataSource: sl()));

  sl.registerFactory<BankTransferRepository>(
      () => BankTransferRepositoryImpl(bankTransferDataSource: sl()));
// ! Data Layer
  sl.registerFactory<BankAccountDataSource>(() => BankAccountDataSourceImpl());
  sl.registerFactory<BankTransferDataSource>(
      () => BankTransferDataSourceImpl());
}
