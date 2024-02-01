import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/src/pages/more_page4.dart';

import 'package:flutter/material.dart';

class PageFour extends StatelessWidget {
  final String head;
  PageFour({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 15,
          left: 18,
          child: Text(
            head,
            style: TextStyle(
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
              print('Container 1 clicked!');
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
              print('Container 2 clicked!');
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
              print('Container 3 clicked!');
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
              print('Container 4 clicked!');
            },
          ),
        ),
      ],
    );
  }
}
