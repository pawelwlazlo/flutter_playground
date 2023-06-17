import 'package:decimal/decimal.dart';

import '../../../domain/bank_transfer/entities/bank_transfer.dart';

abstract class BankTransferDataSource {
  Stream<BankTransfer> getBankTransfers();
}


class BankTransferDataSourceImpl implements BankTransferDataSource {
  @override
  Stream<BankTransfer> getBankTransfers() {
    return Stream.fromIterable(
      // generate 40 bank transfers with names in polish language
      List.generate(40, (index) => BankTransfer(
        amount: Decimal.parse('${index * 100.0}'),
        transferDate: DateTime.now(),
        accountNumber: 'PL 00 0000 0000 0000 0000 0000 0000',
        title: 'Tytuł przelewu $index',
        transferId: index,
        accountingDate: DateTime.now(),
        accountHolderName: 'Jan Kowalski', bankId: 1,//random bank id,
      ))
    );
  }
}