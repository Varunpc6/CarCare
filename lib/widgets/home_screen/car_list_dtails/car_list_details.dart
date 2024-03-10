import 'package:car_maintanance/widgets/home_screen/default_card_widget/default_card.dart';
import 'package:flutter/material.dart';

class CarDetailsList extends StatefulWidget {
  const CarDetailsList({super.key});

  @override
  State<CarDetailsList> createState() => _CarDetailsListState();
}

final ValueNotifier<List<String>> carDetailsNotifier =
    ValueNotifier<List<String>>([]);

class _CarDetailsListState extends State<CarDetailsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: ValueListenableBuilder(
          valueListenable: carDetailsNotifier,
          builder: (context, carDetails, _) {
            return ListView.builder(
              itemCount: carDetails.length,
              itemBuilder: (context, index) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultCard(),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
