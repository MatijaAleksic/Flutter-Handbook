part of 'user_bloc.dart';

class UserState extends Equatable {
  final String email;

  const UserState({required this.email});

  @override
  List<Object?> get props => [email];

  @override
  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(email: json[UserConstants.userCredentialsEmail]);
  }

  Map<String, dynamic> toJson() {
    return {
      UserConstants.userCredentialsEmail: email,
    };
  }
}

class UserIntialState extends UserState {
  const UserIntialState({required super.email});
}

class UserUpdatedState extends UserState {
  const UserUpdatedState({required super.email});
}
