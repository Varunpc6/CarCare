import 'package:car_maintanance/src/main_properties/app_properties.dart';
import 'package:car_maintanance/src/pages/model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: myColor, //---myColor custom variable---
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Vehicle',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.check_sharp,
                  color: Colors.white,
                  size: 26,
                ))
          ],
        ),
        body: ResponsiveTextFieldForm(),
      ),
    );
  }
}
