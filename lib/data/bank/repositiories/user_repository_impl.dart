import 'package:flutter_playground/domain/bank/entities/bank_account.dart';
import 'package:flutter_playground/domain/bank/repositories/bank_account_repository.dart';

import '../datasources/bank_data_source.dart';

class UserRepositoryImpl implements BankAccountRepository {
  final BankAccountDataSource bankAccountDataSource;

  UserRepositoryImpl({required this.bankAccountDataSource});

  @override
  Future<List<BankAccount>> getAccounts() async {
    final accounts = await bankAccountDataSource.getAccounts();
    return accounts.map((acc) => acc.toBankAccount(acc)).toList();
  }

}
