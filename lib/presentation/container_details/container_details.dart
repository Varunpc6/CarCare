import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/refuel_db/refuel_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // data
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final RefuelModel refuelModel = arguments[ConstName.refule];

    final mainTitle =
        Text(arguments.keys.join(', ')); // Refuel title of the page
    final refuelPrice = "₹${refuelModel.price.toString()}";
    final refuelOdometer = refuelModel.odometer.toString();
    final refuelDate = refuelModel.date.toString();
    final refuelTime = refuelModel.time.toString();

    return Scaffold(
      appBar: appBar(mainTitle, refuelModel, context),
      body: Column(
        children: [
          Container(
            // height: 150,
            height: ResSize.height25(context),
            color: Colors.blueGrey[50],
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ----- Total cost -----
                    const Text(
                      ConstName.totalCost,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    // ----- Refule price ---
                    Text(
                      refuelPrice,
                      style: const TextStyle(
                          fontSize: 50, color: AppColors.orange),
                    ),
                    // ----- Odometer with icon -------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          const Icon(Icons.toys_rounded),
                          Text(
                            refuelOdometer,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ],
                    ),
                    // ----- Divider --------
                    const Divider(
                      color: AppColors.white,
                      height: 20,
                      thickness: 1.5,
                    ),
                    // ----- Data and Time --
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(Icons.arrow_back_ios,
                        //         color: AppColors.orange)),
                        SizedBox(
                          child: Row(children: [
                            const Icon(Icons.calendar_month_outlined,
                                color: AppColors.subtitleGray),
                            Text("$refuelDate : $refuelTime"),
                          ]),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          // ----- Type  of the Liquied ---------
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                color: Colors.blueGrey[50],
                height: ResSize.height18(context),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        refuelModel.typeFuel.toString(),
                        style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const Divider(
                        color: AppColors.white,
                        height: 20,
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            const Text('Price / Gal'),
                            Text(
                              '₹${refuelModel.price.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ]),
                          Column(children: [
                            const Text(ConstName.totalCost),
                            Text(
                              '₹${refuelModel.totalCost.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ]),
                          Column(children: [
                            const Text(ConstName.volume),
                            Text(
                              '${refuelModel.gallon.toString()} Gal',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ]),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          Column(
            children: [
              const Text("Complete"),
              const Text(
                "Yes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
                child: Divider(
                  color: AppColors.blackSh1,
                  height: 10,
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Gas station"),
              Text(
                refuelModel.gasStation.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
                child: Divider(
                  color: AppColors.blackSh1,
                  height: 10,
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Reason"),
              Text(
                refuelModel.reason.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // -- AppBar --
  AppBar appBar(Text mainTitle, RefuelModel data, context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      elevation: 0,
      title: mainTitle,
      actions: [
        IconButton(
            onPressed: () async {
              await User().checkDelete(data);
              Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
            },
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}
