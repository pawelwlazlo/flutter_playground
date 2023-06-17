import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/bank_transfer.dart';
import '../repositories/bank_transfer_repository.dart';

class GetBankTransfersUseCase {
  final BankTransferRepository _repository;

  GetBankTransfersUseCase(this._repository);

  Future<Either<Failure, List<BankTransfer>>> call() async {
    return await _repository.getBankTransfers().toList().then((value) => right(value));
  }
}