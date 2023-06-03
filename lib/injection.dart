import 'package:flutter_playground/data/bank/datasources/bank_data_source.dart';
import 'package:flutter_playground/data/bank/repositiories/bank_account_repository_impl.dart';
import 'package:flutter_playground/domain/bank/repositories/bank_account_repository.dart';
import 'package:flutter_playground/domain/bank/usecases/get_bank_accounts_use_case.dart';
import 'package:get_it/get_it.dart';

import 'application/pages/bank/cubit/bank_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
// ! application Layer
// ! Blocs
  sl.registerFactory(() => BankCubit(sl()));
  sl.registerFactory(() =>  GetBankAccountsUseCase(sl()));
  sl.registerFactory<BankAccountRepository>(() => BankAccountRepositoryImpl(bankAccountDataSource: sl()));
  sl.registerFactory<BankAccountDataSource>(() => BankAccountDataSourceImpl());
}