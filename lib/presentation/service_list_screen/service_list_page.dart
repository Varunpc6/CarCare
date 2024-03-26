import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/service_db/service_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});

  @override
  State<ServiceListScreen> createState() => _RefuelListScreenState();
}

class _RefuelListScreenState extends State<ServiceListScreen> {
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
        title: Text("Service"),
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
        valueListenable: serviceNotifier,
        builder: (BuildContext context, List<ServiceModel> list, _) {
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
                    title: Text('ServiceDate: ${data.date}'),
                  ),
                ),
              );
            },
          );
        });
  }

  // click Next Button
  onTap(BuildContext context, ServiceModel expenseModel) {
    Map<String, dynamic> arguments = {
      ConstName.service: expenseModel,
    };

    Navigator.pushNamed(
      context,
      AppRoutes.containerServiceDetailsScreen,
      arguments: arguments,
    );
  }
}
