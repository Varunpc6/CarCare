import 'dart:io';

import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:flutter/material.dart';

class CarListCurrentSn extends StatefulWidget {
  const CarListCurrentSn({Key? key}) : super(key: key);

  @override
  State<CarListCurrentSn> createState() => _CarListCurrentSnState();
}

class _CarListCurrentSnState extends State<CarListCurrentSn> {
  User _addCar = User();
  final border = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.orange),
    borderRadius: BorderRadius.circular(10.0),
  );
  final boxDecoration = BoxDecoration(
    border: Border.all(color: AppColors.orange),
    borderRadius: BorderRadius.circular(10.0),
    color: AppColors.white208,
  );
  @override
  void initState() {
    _addCar = User();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ResSize.left064(context),
      top: ResSize.top1(context),
      right: ResSize.right064(context),
      bottom: ResSize.dotBottom02(context),
      child: SizedBox(
        child: Column(
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: AppColors.bgWhite,
            //     hintText: 'Search',
            //     hintStyle: const TextStyle(color: AppColors.black),
            //     border: border,
            //     enabledBorder: border,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final total = _addCar.displayRegisterDetails()[index];
                  final name = total.carName ?? 'A';
                  return Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 6),
                    child: GestureDetector(
                      onTap: () {
                        // Single tap action
                        stdout.write('Single tap on $name');
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: boxDecoration,
                        child: SingleChildScrollView(
                          child: ExpansionTile(
                            leading: const Icon(
                              Icons.directions_car,
                              color: AppColors.black,
                            ),
                            title: Center(
                              child: Text(
                                name,
                                style: const TextStyle(
                                  color: AppColors.orange225,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Check if index is not the first index before displaying delete button
                                  if (index != 0)
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        // Call the deleteRegisterDetails function with the current index
                                        await _addCar
                                            .deleteRegisterDetails(index);
                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _addCar.displayRegisterDetails().length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // // click Next Button
  // onTap(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.currentCarScreen);
  // }
}
