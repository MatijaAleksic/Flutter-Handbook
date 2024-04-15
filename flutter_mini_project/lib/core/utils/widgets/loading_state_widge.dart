import 'package:flutter/material.dart';
import 'package:flutter_mini_project/core/utils/extensions/screen_util_extension.dart';

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(height: context.height / 3),
      const Text(
          style: TextStyle(
            fontSize: 20,
          ),
          'Loading...')
    ]);
  }
}
