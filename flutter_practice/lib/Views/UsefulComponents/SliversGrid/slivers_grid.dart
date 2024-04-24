import 'package:flutter/material.dart';

class SliversGridExample extends StatelessWidget {
  const SliversGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9 + 1)],
                child: Text('Item ${index + 1}'));
          }, childCount: 60),
        )
      ]),
    );
  }
}
