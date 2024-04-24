
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState>{
  UserListBloc() : super(UserListInitial(users: [
    const User(id: 1, email: "email1", name: 'name1'),
    const User(id: 2, email: "email2", name: 'name2'),
    const User(id: 3, email: "email3", name: 'name3')
  ])){
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  void _addUser(AddUser event, Emitter<UserListState> emit){
    state.users.add(event.user);
    emit(UserListUpdated(users: List<User>.from(state.users)));
  }

  void _deleteUser(DeleteUser event, Emitter<UserListState> emit){
    state.users.remove(event.user);
    emit(UserListUpdated(users: List<User>.from(state.users)));
  }

  void _updateUser(UpdateUser event, Emitter<UserListState> emit){
    for(int i =0; i < state.users.length; i++){
      if(event.user.id == state.users[i].id){
        state.users[i] = event.user;
        break;
      }
    }
    emit(UserListUpdated(users: List<User>.from(state.users)));
  }
}