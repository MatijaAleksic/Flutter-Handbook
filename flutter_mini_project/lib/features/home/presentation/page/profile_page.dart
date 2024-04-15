import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/auth/auth_bloc.dart';
import 'package:flutter_mini_project/features/user/presentation/blocks-cubits/user/user_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (context, state) {
        if (state is LogoutSucess) {
          AppRoutes.onboarding.go(context);
        }
      },
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: (context.height / 10)),
                const Text(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    'PROFILE PAGE'),
                SizedBox(height: context.height / 20),
                Text('User Email: ${state.email}'),
                const SizedBox(height: 50),
                _logoutButton(context)
              ],
            ),
          ),
        );
      }),
    );
  }

  ElevatedButton _logoutButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<AuthBloc>().add(Logout());
          context.read<UserBloc>().add(ClearCredentials());
        },
        child: const Text("Logout"));
  }
}
