import '../entities/bank_transfer.dart';

abstract class BankTransferRepository {
  Stream<BankTransfer> getBankTransfers();

}