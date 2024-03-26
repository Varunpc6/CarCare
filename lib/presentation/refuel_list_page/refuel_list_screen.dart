import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
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
        valueListenable: refuelNotifier,
        builder: (BuildContext context, List<RefuelModel> list, _) {
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
                        217, 255, 184, 121), // Change color as needed
                    borderRadius:
                        BorderRadius.circular(8.0), // Add border radius
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text('Refuel Date: ${data.date}'),
                    subtitle: Text('${data.time}'),
                  ),
                ),
              );
            },
          );
        });
  }

  // click Next Button
  onTap(BuildContext context, RefuelModel refuelModel) {
    Map<String, dynamic> arguments = {
      ConstName.refule: refuelModel,
    };

    Navigator.pushNamed(
      context,
      AppRoutes.containerDetailsScreen,
      arguments: arguments,
    );
  }
}
