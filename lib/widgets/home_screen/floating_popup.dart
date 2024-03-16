import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FloatDialog extends StatelessWidget {
  const FloatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
              BorderSide(width: 5.5, color: Color.fromARGB(212, 255, 153, 0))),
          borderRadius: BorderRadius.circular(40),
        ),
        child: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: const IconThemeData(size: 30),
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 250, 245, 245),
          foregroundColor: Colors.orange[600],
          elevation: 2.0,
          shape: const CircleBorder(),
          children: [
            SpeedDialChild(
              onTap: () => addRoute(context),
              child: const Icon(Icons.room_outlined, color: Colors.white),
              backgroundColor: Colors.green[800],
              label: 'Routes',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              foregroundColor: Colors.black,
              elevation: 5,
            ),
            SpeedDialChild(
              onTap: () => addService(context),
              child: const Icon(Icons.miscellaneous_services_rounded,
                  color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 21, 118, 192),
              label: 'Services',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              elevation: 5,
            ),
            SpeedDialChild(
              onTap: () => addIncome(context),
              child:
                  const Icon(Icons.card_membership_sharp, color: Colors.white),
              backgroundColor: Colors.pink[800],
              label: 'Incomes',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              elevation: 5,
            ),
            SpeedDialChild(
              onTap: () => addExpense(context),
              child:
                  const Icon(Icons.credit_card_outlined, color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 80, 46, 125),
              label: 'Expense',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              elevation: 5,
            ),
            SpeedDialChild(
              onTap: () => addRefule(context),
              child: const Icon(Icons.local_gas_station_rounded,
                  color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 125, 46, 46),
              label: 'Refueling',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              elevation: 5,
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the Refuel Page
  void addRefule(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addRefuelScreen);
  }

  /// Navigates to the Expense Page
  void addExpense(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addExpenseScreen);
  }

  /// Navigates to the Income Page
  void addIncome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addIncomeScreen);
  }

  /// Navigates to the Service Page
  void addService(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addServiceScreen);
  }

  /// Navigates to the Route Page
  void addRoute(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addRouteScreen);
  }
}
