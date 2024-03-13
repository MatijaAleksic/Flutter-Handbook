//koristi se da se vise fajlova tretira kao jedan fajl
part of 'user_list_bloc.dart';

@immutable
abstract class UserListEvent {}


//OVO SU EVENTOVI KOJI CE SE KASNIJE ZVATI NPR.
// userListBloc(context).add(AddUser(user:user));
class AddUser extends UserListEvent {
  final User user;

  AddUser({required this.user});
}

class DeleteUser extends UserListEvent{
  final User user;

  DeleteUser({required this.user});
}

class UpdateUser extends UserListEvent{
  final User user;

  UpdateUser({required this.user});
}