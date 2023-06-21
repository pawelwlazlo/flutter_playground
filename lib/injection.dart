import 'package:flutter_playground/data/bank/datasources/bank_data_source.dart';
import 'package:flutter_playground/data/bank/datasources/user_data_source.dart';
import 'package:flutter_playground/data/bank/repositiories/bank_account_repository_impl.dart';
import 'package:flutter_playground/data/bank/repositiories/bank_transfer_repository_impl.dart';
import 'package:flutter_playground/data/bank/repositiories/user_repository_impl.dart';
import 'package:flutter_playground/domain/bank/repositories/bank_account_repository.dart';
import 'package:flutter_playground/domain/bank/usecases/get_bank_accounts_use_case.dart';
import 'package:flutter_playground/domain/bank_transfer/repositories/bank_transfer_repository.dart';
import 'package:flutter_playground/domain/bank_transfer/usecases/get_transfers_use_case.dart';
import 'package:flutter_playground/domain/login/repositories/user_repository.dart';
import 'package:flutter_playground/domain/login/usecases/check_user_pin_use_case.dart';
import 'package:flutter_playground/domain/login/usecases/get_user_use_case.dart';
import 'package:flutter_playground/domain/login/usecases/read_user_use_case.dart';
import 'package:flutter_playground/domain/login/usecases/save_user_use_case.dart';
import 'package:get_it/get_it.dart';

import 'data/bank/datasources/bank_transfer_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
// ! application Layer
// ! Blocs
/*
 obsługiwane bezpośrednio w Multi providerze w pliku main.dart
*/

// ! Domain Layer
//
// ! Use Cases
  sl.registerFactory(() => GetBankAccountsUseCase(sl()));
  sl.registerFactory(() => GetBankTransfersUseCase(sl()));
  sl.registerFactory(() => GetUserUseCase(sl()));
  sl.registerFactory(() => CheckUserPinUseCase());
  sl.registerFactory(() => ReadUserUseCase(sl()));
  sl.registerFactory(() => SaveUserUseCase(sl()));

// ! Repositories
  sl.registerFactory<BankAccountRepository>(
      () => BankAccountRepositoryImpl(bankAccountDataSource: sl()));

  sl.registerFactory<BankTransferRepository>(
      () => BankTransferRepositoryImpl(bankTransferDataSource: sl()));

  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(sl()));

// ! Data Layer
  sl.registerFactory<BankAccountDataSource>(() => BankAccountDataSourceImpl());
  sl.registerFactory<BankTransferDataSource>(
      () => BankTransferDataSourceImpl());
  sl.registerFactory<UserDataSource>(() => UserDataSourceImpl());
}
