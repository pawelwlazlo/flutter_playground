import '../../core/failure.dart';

abstract class BankError extends Failure {
  BankError({required super.message, required super.errorCode});
}

class BlikError extends BankError {
  BlikError({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}

class PrzelewError extends BankError {
  PrzelewError({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}
