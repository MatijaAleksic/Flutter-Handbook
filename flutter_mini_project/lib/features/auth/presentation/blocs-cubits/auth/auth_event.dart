part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Login extends AuthEvent {
  Login();
}

class Logout extends AuthEvent {
  Logout();
}

class UpdateEmail extends AuthEvent {
  final String email;

  UpdateEmail({required this.email});
}

class UpdatePassword extends AuthEvent {
  final String password;

  UpdatePassword({required this.password});
}

class UpdateShowPassword extends AuthEvent {
  final bool showPassword;

  UpdateShowPassword({required this.showPassword});
}
