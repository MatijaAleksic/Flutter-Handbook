import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/utils/constants/theme_colors.dart';

class OnboardingFooter extends StatelessWidget {
  final Function onPress;
  const OnboardingFooter({required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: SizedBox(
          width: double.infinity,
          height: 60,
          child: _LoginButton(onPress: onPress)),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final Function onPress;
  const _LoginButton({required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.primaryColor,
      ),
      child: const Text(
        'Login',
        style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      onPressed: () => onPress(),
    );
  }
}
