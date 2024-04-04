// import 'package:car_maintanance/constants/constants_cust.dart';
import 'dart:developer';

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/reminder_db/reminder_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  final String head;
  const PageThree({Key? key, required this.head}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  int? typeValue = 1;
  String? carCost;

  // Widget _buildTextField() {
  //   if (typeValue == 1) {
  //     return TextFormField(
  //       decoration: const InputDecoration(
  //         hintText: 'Type of Expense',
  //         labelText: 'Type of Expense',
  //       ),
  //     );
  //   } else if (typeValue == 2) {
  //     return TextFormField(
  //       decoration: const InputDecoration(
  //         hintText: 'Type of Services',
  //         labelText: 'Type of Services',
  //       ),
  //     );
  //   } else {
  //     return const SizedBox
  //         .shrink(); // Hide text field when no radio button is selected
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(context),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet<void>(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return Container(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               const Text(
      //                 'Select Type',
      //                 style:
      //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //               ),
      //               const SizedBox(height: 20),
      //               Row(
      //                 children: [
      //                   Radio(
      //                     value: 1,
      //                     groupValue: typeValue,
      //                     onChanged: (value) {
      //                       setState(() {
      //                         typeValue = value;
      //                       });
      //                     },
      //                   ),
      //                   GestureDetector(
      //                     onTap: () {
      //                       setState(() {
      //                         typeValue = 1;
      //                       });
      //                     },
      //                     child: const Text(
      //                       'Expense',
      //                       style: TextStyle(fontSize: 16),
      //                     ),
      //                   ),
      //                   const SizedBox(width: 20),
      //                   Radio(
      //                     value: 2,
      //                     groupValue: typeValue,
      //                     onChanged: (value) {
      //                       setState(() {
      //                         typeValue = value;
      //                       });
      //                     },
      //                   ),
      //                   GestureDetector(
      //                     onTap: () {
      //                       setState(() {
      //                         typeValue = 2;
      //                       });
      //                     },
      //                     child: const Text(
      //                       'Service',
      //                       style: TextStyle(fontSize: 16),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(height: 20),
      //               _buildTextField(),
      //               const SizedBox(height: 20),
      //               Center(
      //                 child: ElevatedButton(
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.orange,
      //                   ),
      //                   child: const Text(
      //                     ConstName.done,
      //                     style: TextStyle(fontSize: 18),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   backgroundColor: Colors.white,
      //   child: const Icon(
      //     Icons.read_more_sharp,
      //     size: 26,
      //     color: Colors.orange,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  Widget buildListView(BuildContext context) {
    return ValueListenableBuilder<List<ReminderModel>>(
      valueListenable: reminderNotifier,
      builder: (BuildContext context, List<ReminderModel> list, _) {
        if (list.isEmpty) {
          // Show message when the list is empty
          return const Center(
            child: Text(
              ConstName.remindeEmpty,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.subtitleGray,
              ),
            ),
          );
        } else {
          // Show the list when it's not empty
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final data = list[index];
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
                    title: Text('Refuel Date: ${data.date}'),
                    subtitle: Text('${data.odometer}'),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  // click Next Button
  onTap(BuildContext context, ReminderModel reminderModel) {
    log('${reminderModel.expense}');
    Map<String, dynamic> arguments = {
      ConstName.reminders: reminderModel,
    };

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.containerDetailsScreen,
      arguments: arguments,
    );
  }
}
