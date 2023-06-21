import 'package:easy_bank/domain/bank_transfer/entities/bank_transfer.dart';
import 'package:easy_bank/domain/bank_transfer/repositories/bank_transfer_repository.dart';

import '../datasources/bank_transfer_data_source.dart';

class BankTransferRepositoryImpl implements BankTransferRepository {
  final BankTransferDataSource bankTransferDataSource;

  const BankTransferRepositoryImpl({
    required this.bankTransferDataSource,
  });

  @override
  Stream<BankTransfer> getBankTransfers() {
    return bankTransferDataSource.getBankTransfers();
  }
}
