import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // data
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final ServiceModel serviceModel = arguments[ConstName.service];

    final mainTitle =
        Text(arguments.keys.join(', ')); // Refuel title of the page
    final date = serviceModel.date.toString();
    final time = serviceModel.time.toString();
    final odometer = serviceModel.odometer.toString();
    final typeService = serviceModel.service.toString();
    final value = serviceModel.value.toString();
    final reason = serviceModel.reason.toString();
    final place = serviceModel.place.toString();

    return Scaffold(
      appBar: appBar(mainTitle, serviceModel, context),
      body: Column(
        children: [
          // Date and time
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
          // type of expense and the  value
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.typeService),
                      Text(
                        typeService,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(ConstName.value),
                      Text(
                        value,
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
          // Odometer and total cost
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
                        odometer,
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
                        serviceModel.paymentMethod.toString(),
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
          // place or location
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(ConstName.place),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              place,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: AppColors.blackSh1,
            height: 10,
            thickness: 1,
          ),
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
          // Reason and the Note
        ],
      ),
    );
  }

  // -- AppBar --
  AppBar appBar(Text mainTitle, ServiceModel data, context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      title: mainTitle,
      actions: [
        IconButton(
          onPressed: () async {
            await User().checkDeleteService(data);
            Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
