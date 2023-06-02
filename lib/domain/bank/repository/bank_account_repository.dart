import '../entity/bank_account.dart';

abstract class BankAccountRepository {
  Future<Stream<BankAccount>> getAccounts();
}