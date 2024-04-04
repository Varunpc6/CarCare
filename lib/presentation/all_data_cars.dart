import 'package:flutter/material.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';

class DataCar extends StatelessWidget {
  const DataCar({super.key});

  @override
  Widget build(BuildContext context) {
    User carCar = User();

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<MainBoxUser>>(
          future: carCar.displayRegisterDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final users = snapshot.data ?? [];

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text("id"),
                    ),
                    DataColumn(
                      label: Text("Refuel"),
                    ),
                    DataColumn(
                      label: Text("Odometer"),
                    ),
                    DataColumn(
                      label: Text("Price"),
                    ),
                    DataColumn(
                      label: Text("PaymentType"),
                    ),
                    DataColumn(
                      label: Text("Services"),
                    ),
                    DataColumn(
                      label: Text("Route"),
                    ),
                    DataColumn(
                      label: Text("Income"),
                    ),
                    DataColumn(
                      label: Text("Expense"),
                    ),
                    DataColumn(
                      label: Text("Document"),
                    ),
                  ],
                  rows: users.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(Text(user.id.toString())),
                        DataCell(
                          Text(user.refuels != null
                              ? user.refuels!.length.toString()
                              : 'no'),
                        ),
                        DataCell(Text(user.brandName.toString())),
                        DataCell(
                          Text(user.refuels != null
                              ? user.refuels!
                                  .map((refuel) => refuel.price.toString())
                                  .join(', ')
                              : 'no'),
                        ),
                        DataCell(
                          Text(
                            user.refuels != null
                                ? user.refuels!
                                    .map((refuel) =>
                                        refuel.paymentMethod.toString())
                                    .join(', ')
                                : 'no',
                          ),
                        ),
                        DataCell(
                          Text(user.services != null
                              ? user.services!.length.toString()
                              : 'no'),
                        ),
                        DataCell(
                          Text(user.route != null
                              ? user.route!.length.toString()
                              : 'no'),
                        ),
                        DataCell(
                          Text(user.income != null
                              ? user.income!.length.toString()
                              : 'no'),
                        ),
                        DataCell(
                          Text(user.expenses != null
                              ? user.expenses!.length.toString()
                              : 'no'),
                        ),
                        DataCell(
                          Text(user.document != null
                              ? user.document!.length.toString()
                              : 'no'),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
