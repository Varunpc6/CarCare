import 'package:car_maintanance/widgets/home_screen/car_card/current_car_widget.dart';
import 'package:car_maintanance/widgets/home_screen/car_list_dtails/car_list_details.dart';
import 'package:car_maintanance/widgets/home_screen/default_card_widget/default_card.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final String head;
  const PageOne({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CarCard(),
          ),
          CarDetailsList(),

          DefaultCard(),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 5, bottom: 5),
          //     child: ListView.builder(
          //       itemCount: 10,
          //       itemBuilder: (context, index) {
          //         return const Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             DefaultCard(),
          //           ],
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
