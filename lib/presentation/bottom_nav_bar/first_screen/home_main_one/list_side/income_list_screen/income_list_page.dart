import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class IncomeListScreen extends StatefulWidget {
  const IncomeListScreen({super.key});

  @override
  State<IncomeListScreen> createState() => _RefuelListScreenState();
}

class _RefuelListScreenState extends State<IncomeListScreen> {
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
        title: const Text("Income"),
      ),
      body: _buildListView(context),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: incomeNotifier,
      builder: (BuildContext context, List<IncomeModel> list, _) {
        if (list.isEmpty) {
          // Show message when the list is empty
          return const Center(
            child: Text(
              ConstName.incomeEmpty,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.subtitleGray,
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final data = list[index];
                final count = index + 1;
                final date = data.date.toString();
                final time = data.time.toString();
                final value = data.value.toString();
                return GestureDetector(
                  onTap: () {
                    // Navigate to another page here
                    onTap(context, data);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(217, 255, 184, 121),
                      borderRadius:
                          BorderRadius.circular(8.0), // Add border radius
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
                            count.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.txtColor,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        data.income.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                      subtitle: Text(
                        date,
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
                              time,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "₹$value",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
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
  onTap(BuildContext context, IncomeModel expenseModel) {
    Map<String, dynamic> arguments = {
      ConstName.income: expenseModel,
    };

    Navigator.pushNamed(
      context,
      AppRoutes.containerIncomeDetailsScreen,
      arguments: arguments,
    );
  }
}
