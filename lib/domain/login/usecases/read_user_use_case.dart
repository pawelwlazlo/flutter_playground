import '../entities/user.dart';
import '../repositories/user_repository.dart';

class ReadUserUseCase {
  final UserRepository _repository;

  ReadUserUseCase(this._repository);

  Future<User?> execute(String id) async {
    return await _repository.getUserFromStorage();
  }
}