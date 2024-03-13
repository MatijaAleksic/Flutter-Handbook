part of 'user_list_bloc.dart';

abstract  class UserListState{
  List<User> users;
  UserListState({required this.users});
}

//UserListBloc() : super(UserListInitial(users: []))
class UserListInitial extends UserListState {
  UserListInitial({required List<User> users}) : super(users: users);
}

//emit(UserListUpdated(users: state.users));
class UserListUpdated extends UserListState{
  UserListUpdated({required List<User> users}) : super(users: users);
}