import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/Views/UsefulComponents/BlocPattern/user.dart';
import 'package:flutter_practice/Views/UsefulComponents/BlocPattern/user_list/user_list_bloc.dart';

final TextEditingController name = TextEditingController();
final TextEditingController email = TextEditingController();

class BlocHomepage extends StatelessWidget {
  const BlocHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserListBloc()),
      ],
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc CRUD operations"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          name.clear();
          email.clear();
          final id = context.read<UserListBloc>().state.users.length + 1;
          showBottomSheet(context: context, id: id);
        },
        child: const Text('Add User'),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
        if (context.read<UserListBloc>().state.users.isNotEmpty) {
          final users = context.read<UserListBloc>().state.users;
          return ListView.builder(
              itemCount: context.read<UserListBloc>().state.users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return buildUserTile(context, user);
              });
        } else {
          return const SizedBox(
            width: double.infinity,
            child: Center(child: Text('No users found')),
          );
        }
      }),
    );
  }
}

//MODAL ZA DONJI SHEET KOJI ISKOCI
void showBottomSheet({
  required BuildContext context,
  bool isEdit = false,
  required int id,
}) =>
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTextField(controller: name, hint: 'Enter Name'),
                  buildTextField(controller: email, hint: 'Enter Email'),
                  Container(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          final user = User(
                            name: name.text,
                            email: email.text,
                            id: id,
                          );
                          if (isEdit) {
                            context
                                .read<UserListBloc>()
                                .add(UpdateUser(user: user));
                          } else {
                            context
                                .read<UserListBloc>()
                                .add(AddUser(user: user));
                          }
                          Navigator.pop(context);
                        },
                        child: Text(isEdit ? 'Update' : 'Add User'),
                      ))
                ],
              ));
        });
Widget buildTextField({
  required TextEditingController controller,
  required String hint,
}) =>
    Container(
        padding: const EdgeInsets.all(12),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ))));

Widget buildUserTile(BuildContext context, User user) {
  return ListTile(
    title: Text(user.name),
    subtitle: Text(user.email),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            // UserListBloc().add(DeleteUser(user : user));
            context.read<UserListBloc>().add(DeleteUser(user: user));
          },
          icon: const Icon(Icons.delete, size: 30, color: Colors.red),
        ),
        IconButton(
          onPressed: () {
            name.text = user.name;
            email.text = user.email;
            showBottomSheet(context: context, id: user.id, isEdit: true);
          },
          icon: const Icon(Icons.edit, size: 30, color: Colors.green),
        )
      ],
    ),
  );
}
