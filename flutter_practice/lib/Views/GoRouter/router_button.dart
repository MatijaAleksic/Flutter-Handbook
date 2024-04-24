import 'package:flutter/material.dart';
import 'custom_router.dart';

class RouterButton extends StatelessWidget {
  final String path;
  final String name;
  final Color buttonColor;

  const RouterButton(
      {super.key,
      required this.name,
      required this.path,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            customRouter.go('/$path');
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
