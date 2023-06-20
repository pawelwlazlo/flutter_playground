import 'package:flutter_playground/domain/core/failure.dart';

class LoginError extends Failure {
  LoginError({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}