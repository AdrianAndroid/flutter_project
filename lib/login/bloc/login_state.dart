import 'package:equatable/equatable.dart';
import 'package:flutter_project/login/models/password.dart';
import 'package:flutter_project/login/models/username.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final Username username;
  final Password password;

  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, username, password];
}