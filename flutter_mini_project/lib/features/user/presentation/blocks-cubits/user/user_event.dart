part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UpdateCredentials extends UserEvent {
  final String email;

  UpdateCredentials({required this.email});
}

class InitializeUserBloc extends UserEvent {
  final String email;

  InitializeUserBloc({required this.email});
}

class ClearCredentials extends UserEvent {
  ClearCredentials();
}
