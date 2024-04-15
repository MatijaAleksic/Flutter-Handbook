part of 'auth_bloc.dart';

abstract class AuthState {
  String email;
  String password;
  bool obscurePassword;

  AuthState(
      {required this.email,
      required this.password,
      required this.obscurePassword});
}

class LoginInitialState extends AuthState {
  LoginInitialState() : super(email: "", password: "", obscurePassword: true);
}

class LoginUpdatedState extends AuthState {
  LoginUpdatedState(
      {required super.email,
      required super.password,
      required super.obscurePassword});
}

class LoginAttemptSuccess extends AuthState {
  LoginAttemptSuccess(
      {required super.email,
      required super.password,
      required super.obscurePassword});
}

class LogoutSucess extends AuthState {
  LogoutSucess() : super(email: "", password: "", obscurePassword: true);
}
