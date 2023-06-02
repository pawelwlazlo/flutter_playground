import 'package:dartz/dartz.dart';
import 'package:flutter_playground/domain/bank/entity/bank_account.dart';
import 'package:flutter_playground/domain/bank/repository/bank_account_repository.dart';

import '../../core/failure.dart';

class GetBankAccountsUseCase {
  final BankAccountRepository _bankRepository;

  GetBankAccountsUseCase(this._bankRepository);

  Future<Either<Failure, Stream<BankAccount>>> call() async {
    final response = await _bankRepository.getAccounts();
    return right(response);
  }
}
