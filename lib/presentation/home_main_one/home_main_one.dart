import 'package:car_maintanance/widgets/home_screen/car_card/current_car_widget.dart';
import 'package:car_maintanance/widgets/home_screen/default_card_widget/default_card.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final String head;

  const PageOne({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarCard(),
          SizedBox(
            height: 10,
          ),
          DefaultCard(),
        ],
      ),
    );
  }
}
