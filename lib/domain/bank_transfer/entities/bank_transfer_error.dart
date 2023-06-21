import 'package:easy_bank/domain/core/failure.dart';

class BankTrasferError extends Failure {
  BankTrasferError({required super.message, required super.errorCode});
}
