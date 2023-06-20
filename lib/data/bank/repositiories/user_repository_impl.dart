import 'package:dartz/dartz.dart';
import 'package:flutter_playground/data/bank/datasources/user_data_source.dart';
import 'package:flutter_playground/domain/core/failure.dart';
import 'package:flutter_playground/domain/login/entities/login_error.dart';
import 'package:flutter_playground/domain/login/entities/user.dart';
import 'package:flutter_playground/domain/login/repositories/user_repository.dart';

import '../model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, User>> getUserByLoginAndPassword(
      {required String login, required String password}) async {
    try {
      final user = await userDataSource.getUserByLoginAndPassword(
          login: login, password: password);
      return Right(user.toUser());
    } catch (e) {
      return Left(
          LoginError(errorCode: 'USR01', message: "Can't load user data"));
    }
  }

  @override
  Future<User?> getUserFromStorage() async {
    final usr = await userDataSource.getUserFromStorage();
    if (usr != null) {
      return usr.toUser();
    }
    return null;
  }

  @override
  Future<bool> saveUser(User user) async {
    return userDataSource.saveUser(UserModel.fromUser(user));
  }
}
