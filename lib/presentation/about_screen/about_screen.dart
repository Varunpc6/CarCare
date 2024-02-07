import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:car_maintanance/theme/theme_helper.dart';
import 'package:car_maintanance/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.black900,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                    size: 22,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // Add your text here
              const Text(
                'About',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 0,
        ),
        body: Center(
          child: Container(
            width: 267,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(67, 64, 64, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: Colors.orange,
              ),
            ),
            margin: const EdgeInsets.fromLTRB(46, 72, 46, 5),
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 108,
                  width: 130,
                  child: CustomImageView(
                    imagePath: ImageConstant.logoScreen,
                    height: 108,
                    width: 130,
                    radius: BorderRadius.circular(30),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 218,
                  width: 222,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Please rate 5 stars',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      SizedBox(
                        width: 140,
                        height: 40,
                        child: Image.asset(ImageConstant.star),
                      ),
                      const Text(
                        'Follow us',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 26, 25, 23),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 26, 25, 23),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 26, 25, 23),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text("CARCAERE -  0.1"),
                const SizedBox(height: 7),
                const Text("Last Update 30 / 12 / 2024"),
                const SizedBox(height: 6),
                Text("Privacy policy and terms of use",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(decoration: TextDecoration.underline)),
                const SizedBox(height: 6)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the moreOneScreen when the action is triggered.
  onTapContrast(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myAccountScreen);
  }
}
