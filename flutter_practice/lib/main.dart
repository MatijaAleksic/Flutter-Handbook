import 'package:flutter/material.dart';
import 'Views/GoRouter/custom_router.dart';

//Dodatno pogledaj sledece:
// Bottomsheet - showModalBottomSheet<T> function
// Silvers Scroll - Fancy scroll sivers
// Listview Builder

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {
                customRouter.go('/');
              },
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              child: const Text('RouterHome'),
            ),
          ),
        ),
        body: MaterialApp.router(
          // routerDelegate: CustomRouter().customRouter.routerDelegate,
          // routeInformationParser: CustomRouter().customRouter.routeInformationParser,
          routerConfig: customRouter,
        ));
  }
}
