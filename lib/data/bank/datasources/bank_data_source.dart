import 'package:easy_bank/data/bank/model/bank_account.dart';

abstract class BankAccountDataSource {
  Future<List<BankAccountModel>> getAccounts();
}

/// This is implementation of datasource returning a list of bank accounts
/// from a fake API
class BankAccountDataSourceImpl implements BankAccountDataSource {
  @override
  Future<List<BankAccountModel>> getAccounts() async {
    return [
      const BankAccountModel(
          bank: BankModel(
              name: 'ING', logoUrl: 'ing', backgroundColor: 0xFFFFF3E0),
          accountNumber: '1090 1014 0000 0712 1981 2874',
          cardNumber: '1234 5678 9012 3456',
          balance: 304.60),
      const BankAccountModel(
          bank: BankModel(
              name: 'Alior Bank',
              logoUrl: 'alior',
              backgroundColor: 0xFFF3E5F5),
          accountNumber: '2345 1124 4322 0333 1981 2874',
          cardNumber: '2345 6789 0123 4567',
          balance: 23000.36),
    ];
  }
}
