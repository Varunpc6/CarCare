import 'package:car_maintanance/presentation/home_main_four/home_main_four.dart';
import 'package:car_maintanance/presentation/home_main_one/home_main_one.dart';
import 'package:car_maintanance/presentation/home_main_three/home_main_three.dart';
import 'package:car_maintanance/presentation/home_main_two/home_main_two.dart';
import 'package:car_maintanance/src/nav.dart';
import 'package:car_maintanance/widgets/home_screen/floating_popup.dart';

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

  Widget _getPageTitle(int index) {
    switch (index) {
      case 0:
        return RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: 'Welcome to',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w800),
              ),
              TextSpan(
                text: ' CARCARE',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: "\nLet's Go Forward",
                style: TextStyle(
                    color: Color.fromARGB(255, 137, 134, 129),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      case 1:
        return const Text(
          'Report',
          style: TextStyle(
              color: Colors.orange, fontSize: 24, fontWeight: FontWeight.w600),
        );
      case 2:
        return const Text(
          'Reminders',
          style: TextStyle(
              color: Colors.orange, fontSize: 24, fontWeight: FontWeight.w600),
        );
      case 3:
        return const Text(
          'More option',
          style: TextStyle(
              color: Colors.orange, fontSize: 24, fontWeight: FontWeight.w600),
        );
      default:
        return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          titleSpacing: 0, // Adjust as needed
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align the title to the bottom
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0), // Adjust as needed
                  child: _getPageTitle(selectedTab),
                ),
              ],
            ),
          ),
        ),
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
        floatingActionButton: const FloatDialog(),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            setState(() {
              selectedTab = index;
              pageController.jumpToPage(
                  index); // Use jumpToPage to switch to the desired page
            });
          },
          pageController: pageController,
        ),
      ),
    );
  }
}
