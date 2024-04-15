import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(height: context.height / 3),
      Text(
          style: const TextStyle(
            fontSize: 20,
          ),
          errorMessage)
    ]);
  }
}
