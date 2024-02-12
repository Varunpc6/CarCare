import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  final String head;
  const PageTwo({super.key, required this.head});

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
        Center(
          child: SizedBox(
            width: 160,
            height: 200,
            child: Image.asset(ImageConstant.defaultImage),
          ),
        ),
      ],
    );
  }
}
