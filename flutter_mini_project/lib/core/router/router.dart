import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/app/service_locator.dart';
import 'package:flutter_mini_project/core/router/app_routes.dart';
import 'package:flutter_mini_project/features/home/presentation/page/home_page.dart';
import 'package:flutter_mini_project/features/auth/presentation/page/onboarding_page.dart';
import 'package:flutter_mini_project/features/auth/domain/usecase/auth_usecase.dart';
import 'package:flutter_mini_project/features/university/domain/helpers/university_helper.dart';
import 'package:flutter_mini_project/features/university/presentation/page/single_university_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: AppRoutes.home.path, builder: (context, state) => const HomePage()),
  GoRoute(
      path: AppRoutes.onboarding.path,
      builder: (context, state) => const OnboardingPage()),
  GoRoute(
      path: AppRoutes.university.path,
      builder: (context, state) {
        return SingleUniversityPage(
            university:
                UniversityHelper.extractUniversityFromExtra(state.extra));
      })
], redirect: handleRedirect);

Future<String?> handleRedirect(
    BuildContext context, GoRouterState state) async {
  final bool loggedIn =
      await serviceLocator.get<AuthUsecase>().isUserLoggedIn();

  if (!loggedIn) {
    return AppRoutes.onboarding.path;
  }
  if (loggedIn && state.fullPath == '/') {
    return AppRoutes.home.path;
  }

  return null;
}
