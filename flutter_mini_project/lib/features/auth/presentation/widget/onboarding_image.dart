import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String networkImagePath;

  const OnboardingImage({required this.networkImagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.white,
      child: Image.network(networkImagePath),
    );
  }
}
