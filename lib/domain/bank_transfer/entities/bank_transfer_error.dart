import 'package:flutter_playground/domain/core/failure.dart';

class BankTrasferError extends Failure {
  BankTrasferError({required super.message, required super.errorCode});
}