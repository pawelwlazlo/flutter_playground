import 'package:easy_bank/domain/core/failure.dart';

class LoginError extends Failure {
  LoginError({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}