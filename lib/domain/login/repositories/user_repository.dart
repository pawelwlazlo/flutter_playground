import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserByLoginAndPassword(
      {required String login, required String password});
}