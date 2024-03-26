import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/route_db/route_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class RouteListScreen extends StatefulWidget {
  const RouteListScreen({super.key});

  @override
  State<RouteListScreen> createState() => _RefuelListScreenState();
}

class _RefuelListScreenState extends State<RouteListScreen> {
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
        title: Text('Route'),
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
        valueListenable: routeNotifier,
        builder: (BuildContext context, List<RouteModel> list, _) {
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
                    title: Text('Destination: ${data.origin}'),
                  ),
                ),
              );
            },
          );
        });
  }

  // click Next Button
  onTap(BuildContext context, RouteModel routeModel) {
    Map<String, dynamic> arguments = {
      ConstName.route: routeModel,
    };

    Navigator.pushNamed(
      context,
      AppRoutes.containerRouteDetailsScreen,
      arguments: arguments,
    );
  }
}
