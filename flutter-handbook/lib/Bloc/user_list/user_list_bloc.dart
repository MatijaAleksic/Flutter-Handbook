import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState>{
  UserListBloc() : super(UserListInitial(users: [])){
    on<AddUser>(_addUser);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  void _addUser(AddUser event, Emitter<UserListState> emit){
    state.users.add(event.user);
    emit(UserListUpdated(users: state.users));
  }

  void _deleteUser(DeleteUser event, Emitter<UserListState> emit){
    state.users.remove(event.user);
    emit(UserListUpdated(users: state.users));
  }

  void _updateUser(UpdateUser event, Emitter<UserListState> emit){
    for(int i =0; i < state.users.length; i++){
      if(event.user.id == state.users[i].id){
        state.users[i] = event.user;
        break;
      }
    }
    emit(UserListUpdated(users: state.users));
  }
}