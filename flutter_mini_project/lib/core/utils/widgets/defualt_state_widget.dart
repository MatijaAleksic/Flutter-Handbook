import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';

class DefaultStateWidget extends StatelessWidget {
  const DefaultStateWidget({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(height: context.height / 3),
      Text(
          style: const TextStyle(
            fontSize: 20,
          ),
          message)
    ]);
  }
}
