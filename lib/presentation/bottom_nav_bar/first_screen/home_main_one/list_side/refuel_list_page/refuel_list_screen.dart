import 'dart:developer';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RefuelListScreen extends StatefulWidget {
  const RefuelListScreen({super.key});

  @override
  State<RefuelListScreen> createState() => _RefuelListScreenState();
}

class _RefuelListScreenState extends State<RefuelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Refuel"),
      ),
      body: _buildListView(context),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: refuelNotifier,
      builder: (BuildContext context, List<RefuelModel> list, _) {
        if (list.isEmpty) {
          // Show message when the list is empty
          return const Center(
            child: Text(
              ConstName.refuelEmpty,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.subtitleGray,
              ),
            ),
          );
        } else {
          // Show the list when it's not empty
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final data = list[index];
                final time = data.time.toString();
                final date = data.date;
                final count = index.toString();
                final odometer = data.odometer.toString();
                final price = data.price.toString();

                return GestureDetector(
                  onTap: () {
                    onTap(context, data);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(217, 255, 184, 121),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Container(
                        height: ResSize.height05(context),
                        width: ResSize.width1(context),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            count,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.txtColor,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '${ConstName.date}: $date',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                      subtitle: Text(
                        time,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.grey525,
                        ),
                      ),
                      trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${odometer}Km",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "₹$price",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ]),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  // click Next Button
  onTap(BuildContext context, RefuelModel refuelModel) {
    log('${refuelModel.price}');
    Map<String, dynamic> arguments = {
      ConstName.refule: refuelModel,
    };

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.containerDetailsScreen,
      arguments: arguments,
    );
  }
}
