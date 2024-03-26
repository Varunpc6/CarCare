// import 'package:car_maintanance/core/utils/app_colors.dart';
// import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
// import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
// import 'package:car_maintanance/routes/app_routes.dart';
// import 'package:flutter/material.dart';

// class IncomeListScreen extends StatefulWidget {
//   const IncomeListScreen({super.key});

//   @override
//   State<IncomeListScreen> createState() => _RefuelListScreenState();
// }

// class _RefuelListScreenState extends State<IncomeListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.orange,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.arrow_back)),
//         // actions: [
//         // IconButton(
//         //   onPressed: _toggleView,
//         //   icon: Icon(_isListView ? Icons.grid_view : Icons.list),
//         // ),
//         // ],
//       ),
//       body: _buildListView(context),
//     );
//   }

//   Widget _buildListView(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: incomeNotifier,
//         builder: (BuildContext context, List<IncomeModel> list, _) {
//           return ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (context, index) {
//               final data = list[index];
//               return GestureDetector(
//                 onTap: () {
//                   // Navigate to another page here
//                   onTap(context);
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(
//                         116, 211, 160, 116), // Change color as needed
//                     borderRadius:
//                         BorderRadius.circular(8.0), // Add border radius
//                   ),
//                   margin: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: ListTile(
//                     title: Text('income method: ${data.paymentMethod}'),
//                     subtitle: const Text("Oke Keriiiiii"),
//                   ),
//                 ),
//               );
//             },
//           );
//         });
//   }

// // click Next Button
// onTap(BuildContext context) {
//   Navigator.pushNamed(context, AppRoutes.containerDetailsScreen);
// }
// }

import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
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
        title: Text("Income"),
        // actions: [
        // IconButton(
        //   onPressed: _toggleView,
        //   icon: Icon(_isListView ? Icons.grid_view : Icons.list),
        // ),
        // ],
      ),
      body: _buildListView(context),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: incomeNotifier,
        builder: (BuildContext context, List<IncomeModel> list, _) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final data = list[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to another page here
                  onTap(context, data);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        116, 211, 160, 116), // Change color as needed
                    borderRadius:
                        BorderRadius.circular(8.0), // Add border radius
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('income payment: ${data.date}'),
                  ),
                ),
              );
            },
          );
        });
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
