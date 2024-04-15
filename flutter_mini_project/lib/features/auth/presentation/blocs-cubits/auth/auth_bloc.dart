import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/features/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase _authUseCase;

  AuthBloc({required AuthUsecase authUseCase})
      : _authUseCase = authUseCase,
        super(LoginInitialState()) {
    on<Login>(_login);
    on<Logout>(_logout);

    on<UpdateEmail>(_updateEmail);
    on<UpdatePassword>(_updatePassword);
    on<UpdateShowPassword>(_updateShowPassword);
  }

  void _login(Login event, Emitter<AuthState> emit) async {
    await _authUseCase.saveUserCredentials(
        email: state.email, password: state.password);

    emit(LoginAttemptSuccess(
        email: state.email,
        password: state.password,
        obscurePassword: state.obscurePassword));
  }

  void _logout(Logout event, Emitter<AuthState> emit) async {
    await _authUseCase.logout();
    emit(LogoutSucess());
  }

  void _updateEmail(UpdateEmail event, Emitter<AuthState> emit) {
    state.email = event.email;

    emit(LoginUpdatedState(
        email: state.email,
        password: state.password,
        obscurePassword: state.obscurePassword));
  }

  void _updatePassword(UpdatePassword event, Emitter<AuthState> emit) {
    state.password = event.password;

    emit(LoginUpdatedState(
        email: state.email,
        password: state.password,
        obscurePassword: state.obscurePassword));
  }

  void _updateShowPassword(UpdateShowPassword event, Emitter<AuthState> emit) {
    state.obscurePassword = event.showPassword;

    emit(LoginUpdatedState(
        email: state.email,
        password: state.password,
        obscurePassword: state.obscurePassword));
  }
}
