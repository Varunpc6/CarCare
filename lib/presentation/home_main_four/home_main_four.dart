import 'package:car_maintanance/constants/constants_cust.dart';
import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/hive_main/db/models/user_db_reg/user_main_db.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/src/pages/more_page4.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageFour extends StatefulWidget {
  final String head;
  const PageFour({Key? key, required this.head}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  User appUserRegiterApp = User();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 45,
          left: 18,
          child: ResponsiveClickableContainer(
            backgroundImage: ImageConstant.imgRectangleYellow,
            containerName: 'My Account ',
            iconData: Icons.account_box,
            onPressed: () {
              onTapNext1(context);
            },
          ),
        ),
        Positioned(
          top: 45,
          right: 18,
          child: ResponsiveClickableContainer(
            backgroundImage: ImageConstant.imgRectangleSettings,
            containerName: 'Settings ',
            iconData: Icons.alarm,
            onPressed: () {
              onTapNext2(context);
            },
          ),
        ),
        Positioned(
          bottom: 40,
          left: 18,
          child: ResponsiveClickableContainer(
            backgroundImage: ImageConstant.imgRectangleAbout,
            containerName: 'About ',
            iconData: Icons.settings,
            onPressed: () {
              onTapNext3(context);
            },
          ),
        ),
        Positioned(
          bottom: 40,
          right: 18,
          child: ResponsiveClickableContainer(
            backgroundImage: ImageConstant.imgRectangleLogoOut,
            containerName: 'Log out',
            iconData: Icons.logout,
            onPressed: () {
              onTapNext4ShowAlert(context);
            },
          ),
        ),
      ],
    );
  }

  /// click Next Button
  void onTapNext1(BuildContext context) async {
    // Check if there is user data available
    final List<MainBoxUser> users = await appUserRegiterApp.displayRegisterDetails();
    if (users.isEmpty) {
      // Show a popup message indicating no user data is available
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "No User Data",
              style: TextStyle(color: Colors.black),
            ),
            content: const Text(
              "There is no user data available. Please register first.",
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Navigate to the myAccountScreen
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, AppRoutes.myAccountScreen);
    }
  }

  /// click Next Button
  onTapNext2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }

  /// click Next Button
  onTapNext3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aboutScreen);
  }

  void onTapNext4ShowAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Log out ?",
            style: TextStyle(color: Colors.black),
          ),
          content: const Text(
            "When you log out, all expenses will be deleted from this device. Be sure to synchronise manually, in order to save the latest data to your account!",
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () async {
                // Call deleteRegisterDetails to delete user details
                appUserRegiterApp.deleteRegisterDetails(0);

                removeNameUserFromSharedPreferences(); // Remove the key

                Navigator.pop(context);
              },
              child: const Text(
                'DELETE ACCOUNT',
                style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
              ),
            ),
          ],
        );
      },
    );
  }

  // Remove data for the ConstName.prefText1 key from SharedPreferences
  Future<void> removeNameUserFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(ConstName.prefText1);
  }
}
