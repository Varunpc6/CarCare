import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/src/pages/more_page4.dart';

import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  final String head;
  const PageFour({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 15,
          left: 18,
          child: Text(
            head,
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.orange,
            ),
          ),
        ),
        Positioned(
          top: 80,
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
          top: 80,
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
  onTapNext1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myAccountScreen);
  }

  /// click Next Button
  onTapNext2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }

  /// click Next Button
  onTapNext3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aboutScreen);
  }

  /// click Next Button
  onTapNext4ShowAlert(BuildContext context) {
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
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text(
                  'DELETE ACCOUNT',
                  style: TextStyle(color: Color.fromARGB(236, 255, 0, 0)),
                ),
              ),
            ],
          );
        });
  }
}
