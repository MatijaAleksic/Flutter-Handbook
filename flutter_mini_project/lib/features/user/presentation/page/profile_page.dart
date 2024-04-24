import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/core/utils/constants/app_assets.dart';
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
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const _ProfilePageTitle(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const _ProfileAvatarImage(),
                  const SizedBox(height: 20),
                  _UserEmail(email: state.email),
                  const SizedBox(height: 20),
                  const _EditProfileButton(),
                  const SizedBox(height: 20),
                  const Divider(),
                  const _LogoutListTile()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ProfileAvatarImage extends StatelessWidget {
  const _ProfileAvatarImage();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.height / 10,
      backgroundImage: AssetImage(AppAssets.noImagePath),
    );
  }
}

class _UserEmail extends StatelessWidget {
  const _UserEmail({required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        email,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}

class _LogoutListTile extends StatelessWidget {
  const _LogoutListTile();

  void _logout(BuildContext context) {
    context.read<AuthBloc>().add(Logout());
    context.read<UserBloc>().add(ClearCredentials());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35),
      child: GestureDetector(
        onTap: () => _logout(context),
        child: const ListTile(
            leading: _ListTileLeadingIcon(icon: Icons.logout),
            title: _ListTileTitle(title: "Logout")),
      ),
    );
  }
}

class _ListTileLeadingIcon extends StatelessWidget {
  const _ListTileLeadingIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black.withOpacity(0.2),
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}

class _ListTileTitle extends StatelessWidget {
  const _ListTileTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.red),
    );
  }
}

class _EditProfileButton extends StatelessWidget {
  const _EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow.withOpacity(0.7)),
        onPressed: () {
          AppRoutes.editprofile.push(context);
        },
        child: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class _ProfilePageTitle extends StatelessWidget {
  const _ProfilePageTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        'Profile Page');
  }
}
