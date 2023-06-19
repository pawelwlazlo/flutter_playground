import 'package:equatable/equatable.dart';

import '../../../domain/login/entities/user.dart';

class UserModel extends Equatable {
  final int id;
  final String login;
  final String fullName;
  final String password;
  final String pin;

  const UserModel({
    required this.id,
    required this.login,
    required this.fullName,
    required this.password,
    required this.pin,
  });


  @override
  List<Object> get props => [id, login, fullName, password, pin];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'fullName': fullName,
      'password': password,
      'pin': pin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      login: map['login'] as String,
      fullName: map['fullName'] as String,
      password: map['password'] as String,
      pin: map['pin'],
    );
  }

  UserModel copyWith({
    int? id,
    String? login,
    String? fullName,
    String? password,
    String? pin,
  }) {
    return UserModel(
      id: id ?? this.id,
      login: login ?? this.login,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      pin: pin ?? this.pin,
    );
  }

  User toUser() {
    return User(
      id: id,
      login: login,
      fullName: fullName,
      password: password,
      pin: pin,
    );
  }

}