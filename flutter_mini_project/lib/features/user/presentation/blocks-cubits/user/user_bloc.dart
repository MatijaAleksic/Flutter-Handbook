import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/features/user/domain/constants/user_constants.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(const UserIntialState(email: "")) {
    on<UpdateCredentials>(_updateCredentials);
    on<InitializeUserBloc>(_initializeUserBloc);
    on<ClearCredentials>(_clearCredentials);
  }

  void _updateCredentials(UpdateCredentials event, Emitter<UserState> emit) {
    emit(UserUpdatedState(email: event.email));
  }

  void _initializeUserBloc(InitializeUserBloc event, Emitter<UserState> emit) {
    emit(UserIntialState(email: event.email));
  }

  void _clearCredentials(ClearCredentials event, Emitter<UserState> emit) {
    emit(const UserIntialState(email: ""));
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }
}
