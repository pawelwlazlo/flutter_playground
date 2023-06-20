import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String login;
  final String fullName;
  final String password;
  final String pin;

  const User({
    required this.id,
    required this.login,
    required this.fullName,
    required this.password,
    required this.pin,
  });

  User copyWith({
    int? id,
    String? login,
    String? fullName,
    String? password,
    String? pin,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      pin: pin ?? this.pin,
    );
  }

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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      login: map['login'] as String,
      fullName: map['fullName'] as String,
      password: map['password'] as String,
      pin: map['pin'],
    );
  }
}
