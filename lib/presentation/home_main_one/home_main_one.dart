import 'package:car_maintanance/core/utils/image_constant.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final String head;

  const PageOne({Key? key, required this.head}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.currentCarScreen);
            },
            child: Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 127, 7),
                  borderRadius: BorderRadius.circular(30)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.create_new_folder,
                    color: Colors.white,
                  ),
                  Text(
                    ' BMW ',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstant.defaultImage,
                          width: 100,
                        )
                      ]),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ready to start?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Click and add your first\nRefueling, Expense, Service or Income.',
                        style: TextStyle(
                            color: Color.fromARGB(134, 0, 0, 0),
                            fontSize: 14,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
