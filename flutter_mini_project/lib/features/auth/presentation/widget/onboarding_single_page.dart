import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mini_project/features/auth/presentation/widget/onboarding_image.dart';

class OnboardingSinglePage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingSinglePage(
      {required this.title,
      required this.description,
      required this.imagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 45, 35, 0),
      child: Center(
        child: Column(
          children: [
            OnboardingImage(networkImagePath: imagePath),
            _OnBoardingSinglePageTitle(title: title),
            const SizedBox(height: 40),
            _OnBoardingSinglePageDescription(description: description)
          ],
        ),
      ),
    );
  }
}

class _OnBoardingSinglePageTitle extends StatelessWidget {
  const _OnBoardingSinglePageTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }
}

class _OnBoardingSinglePageDescription extends StatelessWidget {
  const _OnBoardingSinglePageDescription({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 17,
      ),
    );
  }
}
