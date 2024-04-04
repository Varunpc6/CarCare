import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class IncomeDetailsScreen extends StatelessWidget {
  const IncomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // data
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final IncomeModel incomeModel = arguments[ConstName.income];
    final mainTitle =
        Text(arguments.keys.join(', ')); // Refuel title of the page
    final date = incomeModel.date.toString();
    final time = incomeModel.time.toString();
    final odometer = incomeModel.odometer.toString();
    final typeIncome = incomeModel.income.toString();
    final value = incomeModel.value.toString();
    final reason = incomeModel.note.toString();

    return Scaffold(
      appBar: appBar(mainTitle, incomeModel, context),
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
          // Odometer and the  value
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
          // type of the income
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
                        typeIncome,
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
          // Reason and the Note
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
  AppBar appBar(Text mainTitle, IncomeModel data, context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      title: mainTitle,
      actions: [
        IconButton(
            onPressed: () async {
              await User().checkDeleteIncome(data);
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}
