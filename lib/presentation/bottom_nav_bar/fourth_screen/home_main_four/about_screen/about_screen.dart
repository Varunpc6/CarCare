import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title: const Text(
          "About us",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Terms and conditions"),
            onTap: () {
              onTapNext1(context);
            },
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () {
              onTapNext2(context);
            },
          ),
        ],
      ),
    );
  }

  /// click Next Button
  onTapNext1(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.termsAndConditionScreen);
  }

  onTapNext2(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.privacyPolicyScreen);
  }
}
