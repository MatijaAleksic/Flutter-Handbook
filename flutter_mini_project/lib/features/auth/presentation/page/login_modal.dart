import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';
import 'package:flutter_mini_project/features/auth/domain/constants/auth_validation_use_case.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/auth/auth_bloc.dart';
import 'package:flutter_mini_project/features/user/presentation/blocks-cubits/user/user_bloc.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({super.key});

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.height * 0.6),
          child: BlocListener(
            bloc: BlocProvider.of<AuthBloc>(context),
            listener: (context, state) {
              if (state is LoginAttemptSuccess) {
                Navigator.pop(context);
                AppRoutes.home.go(context);
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Center(
                      child: Container(
                    padding: const EdgeInsets.all(70),
                    child: Column(
                      children: [
                        _EmailFormField(state: state),
                        _PasswordFormField(state: state),
                        const SizedBox(height: 30),
                        _LoginFormButton(state: state, formKey: _formKey)
                      ],
                    ),
                  )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailFormField extends StatelessWidget {
  final AuthState state;

  const _EmailFormField({required this.state});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: state.email,
      decoration:
          const InputDecoration(icon: Icon(Icons.email), labelText: "Email"),
      validator: (value) {
        return serviceLocator.get<AuthValidationUseCase>().validateEmail(value);
      },
      onChanged: (value) {
        context.read<AuthBloc>().add(UpdateEmail(email: value));
      },
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  final AuthState state;
  const _PasswordFormField({required this.state});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: state.password,
        obscureText: state.obscurePassword,
        decoration: InputDecoration(
            icon: const Icon(Icons.password),
            labelText: "Password",
            suffixIcon: IconButton(
                icon: Icon(state.obscurePassword
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  context.read<AuthBloc>().add(
                      UpdateShowPassword(showPassword: !state.obscurePassword));
                })),
        validator: (value) {
          return serviceLocator
              .get<AuthValidationUseCase>()
              .validatePassword(value);
        },
        onChanged: (value) {
          context.read<AuthBloc>().add(UpdatePassword(password: value));
        });
  }
}

class _LoginFormButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthState state;

  const _LoginFormButton({required this.state, required this.formKey});

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
              context.read<AuthBloc>().add(Login());

              context
                  .read<UserBloc>()
                  .add(InitializeUserBloc(email: state.email));
            }
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
