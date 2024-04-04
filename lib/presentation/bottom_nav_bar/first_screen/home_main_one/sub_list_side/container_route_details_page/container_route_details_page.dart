import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouteDetailsScreen extends StatelessWidget {
  const RouteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // data
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final RouteModel routeModel = arguments[ConstName.route];

    final mainTitle =
        Text(arguments.keys.join(', ')); // Refuel title of the page
    final origin = routeModel.origin.toString();
    final sDate = routeModel.startDate.toString();
    final sTime = routeModel.startTime.toString();
    final endDate = routeModel.endDate.toString();
    final endTime = routeModel.endTime.toString();
    final initOdometer = routeModel.initialOdometer.toString();
    final finalOdometer = routeModel.finalOdometer.toString();
    final reason = routeModel.reason.toString();
    final destination = routeModel.destination.toString();
    final total = routeModel.total.toString();
    final paymentMethod = routeModel.paymentMethod.toString();
    final distance = int.parse(finalOdometer) - int.parse(initOdometer);

    return Scaffold(
      appBar: appBar(mainTitle, routeModel, context),
      body: Column(
        children: [
          // Date and time and the InitialDate and time
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$sDate \n $sTime',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$endDate \n $endTime',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.blackSh1,
            height: 10,
            thickness: 1,
          ),
          // InitialOdometer and Final odometer
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.initialOdometer),
                      Text(
                        initOdometer,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.finalDestination),
                      Text(
                        finalOdometer,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.blackSh1,
            height: 10,
            thickness: 1,
          ),
          // Distance & value & total value
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.odometer),
                      Text(
                        distance.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.totalCost),
                      Text(
                        total,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.blackSh1,
            height: 10,
            thickness: 1,
          ),
          // destination and the finalDestination
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.origin),
                      Text(
                        origin,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.destination),
                      Text(
                        destination,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.blackSh1,
            height: 10,
            thickness: 1,
          ),
          // Payment Method
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(ConstName.paymentMethod),
          ),
          Text(
            paymentMethod,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: AppColors.blackSh1,
            height: 10,
            thickness: 1,
          ),
          // Reason and the Notes
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(ConstName.reason),
          ),
          Text(
            reason,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // -- AppBar --
  AppBar appBar(Text mainTitle, RouteModel data, context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      title: mainTitle,
      actions: [
        IconButton(
            onPressed: () async {
              await User().checkDeleteRoute(data);
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}
