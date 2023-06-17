import 'package:decimal/decimal.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/bank_transfer/entities/bank_transfer.dart';

abstract class BankTransferDataSource {
  Stream<BankTransfer> getBankTransfers();
}

class BankTransferDataSourceImpl implements BankTransferDataSource {
  @override
  Stream<BankTransfer> getBankTransfers() {
    final faker = Faker.instance;
    const bankIds = [0, 1, 2];
    const uuid = Uuid();
    return Stream.fromIterable(
        // generate 40 bank transfers with names in polish language
        List.generate(
            40,
            (index) => BankTransfer(
                  amount: Decimal.parse('${index * 100.0}'),
                  transferDate: DateTime.now(),
                  accountNumber:
                      'PL 00 ${faker.datatype.number(min: 1111, max: 9999)} 0000 0000 0000 0000 ${faker.datatype.number(min: 1111, max: 9999)}',
                  title: 'Tytuł przelewu $index',
                  transferId: uuid.v4(),
                  accountingDate: DateTime.now(),
                  accountHolderName:
                      '${faker.locale.name.firstName} ${faker.locale.name.lastName}',
                  bankId: faker.datatype.number(min: 0, max: 2),
                )));
  }
}
