import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SaveUserUseCase {
final UserRepository _repository;

  SaveUserUseCase(this._repository);

  Future<void> call(User user) async {
    await _repository.saveUser(user);
  }
}