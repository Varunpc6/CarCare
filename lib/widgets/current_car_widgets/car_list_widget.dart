import 'dart:developer';
import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:car_maintanance/shared_Pref/shared_class.dart';
import 'package:flutter/material.dart';

class CarListCurrentSn extends StatefulWidget {
  const CarListCurrentSn({Key? key}) : super(key: key);

  @override
  State<CarListCurrentSn> createState() => _CarListCurrentSnState();
}

class _CarListCurrentSnState extends State<CarListCurrentSn> {
  final User _user = User();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ResSize.left064(context),
      top: ResSize.top1(context),
      right: ResSize.right064(context),
      bottom: ResSize.dotBottom02(context),
      child: SizedBox(
        child: ValueListenableBuilder(
          valueListenable: _user.carListNotifier,
          builder: (context, List<MainBoxUser> newList, _) {
            final cars = newList;

            print("hello ---------- ${cars.length}---------");
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final data = newList[index];
                      log("***********-----------${data.id}-----*********");
                      // Check if index is not 0, render delete button
                      final bool canDelete = index != 0;
                      return Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.orange),
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.white208,
                          ),
                          child: SingleChildScrollView(
                            child: ListTile(
                              leading: const Icon(
                                Icons.directions_car,
                                color: AppColors.black,
                              ),
                              title: Center(
                                child: Text(
                                  data.brandName!,
                                  style: const TextStyle(
                                    color: AppColors.orange225,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              // Render delete button only if index is not 0
                              trailing: canDelete
                                  ? IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        await _user
                                            .deleteRegisterDetails(index);
                                      },
                                    )
                                  : null,
                              onTap: () {
                                log("${data.id.toString()} data : ${data.brandName!}");

                                SharedPref().setCarBrand(
                                    brandName: data.brandName,
                                    id: '${data.id}');

                                // Single tap action
                                Navigator.of(context).pop(data.brandName);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: cars.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
