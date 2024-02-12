import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final String head;

  const PageOne({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 18,
          child: Row(
            children: [
              const Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.black,
                ),
              ),
              Text(
                head,
                style: const TextStyle(
                  fontSize: 30.0,
                  color: Colors.orange,
                ),
              )
            ],
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
