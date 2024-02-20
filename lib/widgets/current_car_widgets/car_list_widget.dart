import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:flutter/material.dart';

class CarListCurrentSn extends StatefulWidget {
  const CarListCurrentSn({super.key});

  @override
  State<CarListCurrentSn> createState() => _CarListCurrentSnState();
}

class _CarListCurrentSnState extends State<CarListCurrentSn> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ResSize.left064(context), // Adjusted for responsiveness
      top: ResSize.top1(context),
      right: ResSize.right064(context),
      bottom: ResSize.dotBottom02(context),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 242, 246, 250),
                  hintText: 'Search',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(117, 0, 0, 0)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // Adjusted for responsiveness
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.orange), // Border color set to orange
                  borderRadius: BorderRadius.circular(10.0), // Adjust as needed
                  color: const Color.fromARGB(
                      208, 242, 242, 242), // Background color
                ),
                child: const Center(
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_car,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Car Model Name',
                      style: TextStyle(
                        color: Color.fromARGB(225, 43, 26, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
