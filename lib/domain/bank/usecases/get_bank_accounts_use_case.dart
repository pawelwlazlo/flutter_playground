import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/bank_account.dart';
import '../repositories/bank_account_repository.dart';

class GetBankAccountsUseCase {
  final BankAccountRepository _bankRepository;

  GetBankAccountsUseCase(this._bankRepository);

  Future<Either<Failure, List<BankAccount>>> call() async {
    final response = await _bankRepository.getAccounts();
    return right(response);
  }
}
