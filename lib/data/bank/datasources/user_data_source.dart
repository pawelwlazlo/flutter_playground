import '../model/user.dart';

abstract class UserDataSource {
  Future<UserModel> getUserById({required int id});
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<UserModel> getUserById({required int id}) {
    return switch(id) {
      1 => Future.value(const UserModel(id: 1, login: 'a', fullName: 'Adam Nowak', password: 'a', pin: 1234)),
      2 => Future.value(const UserModel(id: 2, login: 'b', fullName: 'Zofia Kowalska', password: 'b', pin: 1234)),
      _ => throw Exception('User not found'),
    };
  }
}