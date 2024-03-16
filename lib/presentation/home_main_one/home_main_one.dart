import 'package:car_maintanance/presentation/all_data_cars.dart';
import 'package:car_maintanance/widgets/home_screen/car_card/current_car_widget.dart';
import 'package:car_maintanance/widgets/home_screen/car_list_dtails/car_list_details.dart';
import 'package:car_maintanance/widgets/home_screen/default_card_widget/default_card.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final String head;
  const PageOne({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CarCard(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const DataCar()),
                    );
                  },
                  child: const Text('Car Details'),
                ), // ---------- Data Showing all Car OpenBoxses in here this function TEMP**** ---------
              ],
            ),
          ),
          const DefaultCard(),
          const CarDetailsList(),
        ],
      ),
    );
  }
}
