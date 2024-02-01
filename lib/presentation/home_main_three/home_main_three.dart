import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  final String head;
  const PageThree({super.key, required this.head});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 18,
          child: Text(
            head,
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
