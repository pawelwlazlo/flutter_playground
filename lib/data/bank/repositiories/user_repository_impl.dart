import 'package:dartz/dartz.dart';
import 'package:flutter_playground/data/bank/datasources/user_data_source.dart';
import 'package:flutter_playground/domain/core/failure.dart';
import 'package:flutter_playground/domain/login/entities/login_error.dart';
import 'package:flutter_playground/domain/login/entities/user.dart';
import 'package:flutter_playground/domain/login/repositories/UserRepository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, User>> getUserById({required int id}) async {
    try {
      final user = await userDataSource.getUserById(id: id);
      return Right(user.toUser());
    } catch (e) {
      return Left(
          LoginError(errorCode: 'USR01', message: "Can't load user data"));
    }
  }
}
