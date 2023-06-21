import 'package:easy_bank/domain/bank/entities/bank_account.dart';
import 'package:easy_bank/domain/bank/repositories/bank_account_repository.dart';

import '../datasources/bank_data_source.dart';

class BankAccountRepositoryImpl implements BankAccountRepository {
  final BankAccountDataSource bankAccountDataSource;

  BankAccountRepositoryImpl({required this.bankAccountDataSource});

  @override
  Future<List<BankAccount>> getAccounts() async {
    final accounts = await bankAccountDataSource.getAccounts();
    return accounts.map((acc) => acc.toBankAccount(acc)).toList();
  }

}