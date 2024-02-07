import 'package:car_maintanance/presentation/home_main_four/home_main_four.dart';
import 'package:car_maintanance/presentation/home_main_one/home_main_one.dart';
import 'package:car_maintanance/presentation/home_main_three/home_main_three.dart';
import 'package:car_maintanance/presentation/home_main_two/home_main_two.dart';
import 'package:car_maintanance/src/nav.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedTab);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedTab = index;
            });
          },
          children: const [
            // Page In
            PageOne(head: 'CARCARE'),
            PageTwo(head: 'Report'),
            PageThree(head: 'Reminders'),
            PageFour(head: 'More option'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 0,
              onPressed: () => debugPrint("Add Button pressed"),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    width: 4, color: Color.fromARGB(28, 255, 154, 86)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 239, 161, 109),
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            setState(() {
              selectedTab = index;
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          pageController: pageController,
        ),
      ),
    );
  }
}
