import 'package:dartz/dartz.dart';
import 'package:flutter_playground/domain/core/failure.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  Future<Either<Failure, User>> call(
      {required String login, required String password}) async {
    return await _userRepository.getUserByLoginAndPassword(
        login: login, password: password);
  }
}