abstract class Failure {
  final String message;
  final String errorCode;

  Failure({required this.message, required this.errorCode});

  @override
  String toString() {
    return 'Error: $errorCode: $message';
  }
}

class ServerFailure extends Failure {
  ServerFailure({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}

class NetworkFailure extends Failure {
  NetworkFailure({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}

class CacheFailure extends Failure {
  CacheFailure({required String message, required String errorCode})
      : super(message: message, errorCode: errorCode);
}
