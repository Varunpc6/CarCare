import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/widgets/current_car_widgets/app_bar_widgets.dart';
import 'package:car_maintanance/widgets/current_car_widgets/background_image_widget.dart';
import 'package:car_maintanance/widgets/current_car_widgets/car_list_widget.dart';
import 'package:flutter/material.dart';

class CurrentCarScreen extends StatefulWidget {
  const CurrentCarScreen({Key? key}) : super(key: key);

  @override
  State<CurrentCarScreen> createState() => _CurrentCarScreenState();
}

class _CurrentCarScreenState extends State<CurrentCarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background Image Rising on TextField click time
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whitesf5,
        body: SizedBox(
          width: ResSize.width(context),
          height: ResSize.height(context),
          child: const Stack(
            children: [
              BgImage(), // Background Image
              AppBarCurrentSrn(), // AppBar
              CarListCurrentSn(), // CarList
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onTap(context);
          },
          backgroundColor: AppColors.orange,
          child: const Icon(
            Icons.directions_car_sharp,
            size: 26,
            color: AppColors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }

  // click Next Button
  onTap(BuildContext context) async {
    Navigator.pushNamed(context, AppRoutes.editCarScreen);
  }
}
