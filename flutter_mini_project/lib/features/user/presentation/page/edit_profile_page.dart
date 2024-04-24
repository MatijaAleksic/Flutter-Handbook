import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/features/auth/domain/constants/auth_validation_use_case.dart';
import 'package:flutter_mini_project/features/user/presentation/blocks-cubits/user/user_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(70),
              child: Column(
                children: [
                  _EmailFormField(
                    emailController: emailController,
                  ),
                  const SizedBox(height: 30),
                  _UpdateUserInfoButton(
                    formKey: _formKey,
                    emailController: emailController,
                  ),
                  const _GoBackButton()
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _EmailFormField extends StatelessWidget {
  const _EmailFormField({required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.read<UserBloc>().state.email,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email),
          labelText: "Email",
          border: OutlineInputBorder()),
      validator: (value) {
        return serviceLocator.get<AuthValidationUseCase>().validateEmail(value);
      },
      onChanged: (value) {
        emailController.text = value;
      },
    );
  }
}

class _UpdateUserInfoButton extends StatelessWidget {
  const _UpdateUserInfoButton(
      {required this.emailController, required this.formKey});

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.primaryColor,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context
                  .read<UserBloc>()
                  .add(UpdateCredentials(email: emailController.text));
              AppRoutes.editprofile.goBack(context);
            }
          },
          child: const Text(
            "Update",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class _GoBackButton extends StatelessWidget {
  const _GoBackButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.primaryColor,
          ),
          onPressed: () {
            AppRoutes.editprofile.goBack(context);
          },
          child: const Text(
            "Go Back",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
