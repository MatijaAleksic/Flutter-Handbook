import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  home(
    path: '/home',
  ),
  onboarding(
    path: '/',
  ),
  university(
    path: '/university',
  );

  const AppRoutes({
    required this.path,
  });

  final String path;
}

extension AppRouteNavigation on AppRoutes {
  void go(BuildContext context) => context.go(path);

  void push(BuildContext context, {Object? extra}) =>
      context.push(path, extra: extra);

  void goBack(BuildContext context) => context.pop();
}
