import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:easy_bank/application/core/utils/sha_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../model/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> getUserByLoginAndPassword(
      {required String login, required String password});

  Future<bool> saveUser(UserModel user);
  Future<UserModel?> getUserFromStorage();
}

class UserDataSourceImpl implements UserDataSource {
  final _storage = const FlutterSecureStorage();

  @override
  Future<UserModel> getUserByLoginAndPassword(
      {required String login, required String password}) {
    final users = [
      const UserModel(
          id: 1,
          login: 'a',
          fullName: 'Adam Nowak',
          password:
              'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb',
          pin:
              '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
      const UserModel(
          id: 2,
          login: 'zofia@gmail.com',
          fullName: 'Zofia Kowalska',
          password:
              '51b40b024b929e2ee82436073993b1e9da075683eb9dc9d3f491e82bc1c79f86',
          pin:
              '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c'),
    ];

    var sha256 = ShaUtil.getSha256(password);
    var foundUser = users.firstWhere((user) {
      return user.login == login && user.password == sha256;
    }, orElse: () => throw Exception('User not found'));

    return Future.delayed(const Duration(seconds: 1), () => foundUser);
  }

  @override
  Future<bool> saveUser(UserModel user) async {
    try {
      _storage.write(key: "EASY_BANK_user", value: jsonEncode(user));
      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }

  @override
  Future<UserModel?> getUserFromStorage() async {
    final userObj = await _storage.read(key: "EASY_BANK_user");
    if (userObj != null) {
      final user = jsonDecode(userObj);
      return user;
    } else {
      return null;
    }
  }
}
