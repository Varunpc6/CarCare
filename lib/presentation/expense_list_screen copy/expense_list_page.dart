import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  State<ExpenseListScreen> createState() => _RefuelListScreenState();
}

class _RefuelListScreenState extends State<ExpenseListScreen> {
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
        title: Text("Expense"),
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
        valueListenable: expenseNotifier,
        builder: (BuildContext context, List<ExpenseModel> list, _) {
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
                    title: Text('Expense: ${data.date}'),
                  ),
                ),
              );
            },
          );
        });
  }

  // click Next Button
  onTap(BuildContext context, ExpenseModel expenseModel) {
    Map<String, dynamic> arguments = {
      ConstName.expense: expenseModel,
    };

    Navigator.pushNamed(
      context,
      AppRoutes.containerExpenseDetailsScreen,
      arguments: arguments,
    );
  }
}
