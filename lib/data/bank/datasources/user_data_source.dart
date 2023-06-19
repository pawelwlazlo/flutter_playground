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
          pin: '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
      const UserModel(
          id: 2,
          login: 'zofia@gmail.com',
          fullName: 'Zofia Kowalska',
          password: '51b40b024b929e2ee82436073993b1e9da075683eb9dc9d3f491e82bc1c79f86',
          pin: '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c'),
    ];

    var sha256 = ShaUtil.getSha256(password);
    var foundUser = users.firstWhere((user) {
      return user.login == login && user.password == sha256;
    }, orElse: () => throw Exception('User not found'));

    return Future.delayed(const Duration(seconds: 1), () => foundUser);
  }
}
