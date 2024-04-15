import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/router/router.dart';
import 'package:flutter_mini_project/core/utils/helpers/bloc_helper.dart';
import 'package:flutter_mini_project/features/auth/presentation/blocs-cubits/auth/auth_bloc.dart';
import 'package:flutter_mini_project/features/user/presentation/blocks-cubits/user/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHydratedBlocConfig();
  await registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
            create: (context) => serviceLocator.get<UserBloc>()),
        BlocProvider<AuthBloc>(
            create: (context) => serviceLocator.get<AuthBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
