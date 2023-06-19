import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_playground/application/core/utils/sha_util.dart';

import '../model/user.dart';

abstract class UserDataSource {
  Future<UserModel> getUserByLoginAndPassword(
      {required String login, required String password});
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<UserModel> getUserByLoginAndPassword(
      {required String login, required String password}) {
    final users = [
      const UserModel(
          id: 1,
          login: 'a',
          fullName: 'Adam Nowak',
          password: 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb',
          pin: '1234'),
      const UserModel(
          id: 2,
          login: 'b',
          fullName: 'Zofia Kowalska',
          password: 'b',
          pin: '1234'),
    ];

    var sha256 = ShaUtil.getSha256(password);
    var foundUser = users.firstWhere((user) {
      return user.login == login && user.password == sha256;
    }, orElse: () => throw Exception('User not found'));

    return Future.delayed(const Duration(seconds: 1), () => foundUser);
  }
}
