// import 'package:car_maintanance/core/utils/image_constant.dart';
// import 'package:car_maintanance/hive_main/db/db_functions/second_user_form.dart';
// import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
// import 'package:car_maintanance/widgets/home_second_screen/tab_bar.dart';
// import 'package:flutter/material.dart';

// class PageTwo extends StatefulWidget {
//   final String head;
//   const PageTwo({Key? key, required this.head}) : super(key: key);

//   @override
//   PageTwoState createState() => PageTwoState();
// }

// class PageTwoState extends State<PageTwo> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: choices.length, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: TabBar(
//           controller: _tabController,
//           isScrollable: true,
//           tabs: choices.map<Widget>((Choice choice) {
//             return Tab(
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: _tabController.index == choices.indexOf(choice)
//                         ? Colors.orange
//                         : Colors.transparent,
//                     width: 1.5,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                   color: _tabController.index == choices.indexOf(choice)
//                       ? Colors.orange
//                       : Colors.transparent,
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Row(
//                     children: [
//                       Icon(
//                         choice.icon,
//                         color: _tabController.index == choices.indexOf(choice)
//                             ? Colors.white
//                             : const Color.fromARGB(255, 74, 74, 74),
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         choice.title,
//                         style: TextStyle(
//                           color: _tabController.index == choices.indexOf(choice)
//                               ? Colors.white
//                               : const Color.fromARGB(255, 74, 74, 74),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//           indicator: const BoxDecoration(),
//           onTap: (index) {
//             setState(() {});
//           },
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: choices.map<Widget>((Choice choice) {
//           return TabContentWidget(
//             choice: choice,
//             dataFuture: () {
//               if (choice.title == "Tab 1") {
//                 return User().getAllDataCount();
//               } else if (choice.title == "Tab 2") {
//                 return SecUser().getTotalRefuelPrice();
//               } else {
//                 return User().getAllDataCount();
//               }
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

// class TabContentWidget extends StatelessWidget {
//   final Choice choice;

// const TabContentWidget({
//   Key? key,
//   required this.choice,
//   required Future<int> Function() dataFuture,
// }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           ConstrainedBox(
//             constraints: const BoxConstraints(
//               maxHeight: 45,
//               maxWidth: 500,
//               minHeight: 45,
//               minWidth: 150,
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.orange,
//                   width: 1.5,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FutureBuilder(
//                     future: User().getAllDataCount(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         // Display a loading indicator while waiting for the future to complete
//                         return const CircularProgressIndicator();
//                       } else if (snapshot.hasError) {
//                         // Display an error message if the future encounters an error
//                         return Text('Error:${snapshot.error}');
//                       } else {
//                         // Display the count of total data when the future completes successfully
//                         return SizedBox(
//                           height: 45,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Text(
//                                 '${snapshot.data} entries',
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           FutureBuilder(
//             future: User().getOdometerSum(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Display a loading indicator while waiting for the future to complete
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 // Display an error message if the future encounters an error
//                 return const Text(
//                   'Error: No Values',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 );
//               } else if (snapshot.hasData) {
//                 // Display the data if the future completes successfully
//                 return ListTile(
//                   leading: const Icon(Icons.speed),
//                   title: Text(
//                     'Total Odometer: ${snapshot.data}',
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//               } else {
//                 // Handle the case where snapshot has no error but also no data
//                 return const Text(
//                   'No data available',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 );
//               }
//             },
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 150,
//             width: 500,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//               image: DecorationImage(
//                 image: AssetImage(ImageConstant.reminderImg),
//                 fit: BoxFit
//                     .cover, // You might adjust the fit based on your needs
//               ),
//             ),
//             child: Center(
//                 child: Text(
//               "data",
//               style: TextStyle(color: Colors.orange),
//             )),
//           ),

//           // Add more widgets based on your requirements
//         ],
//       ),
//     );
//   }
// }

import 'package:car_maintanance/presentation/bottom_nav_bar/second_screen/models/choice.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/second_screen/widgets/tab_content_widget.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  final String head;
  const PageTwo({Key? key, required this.head}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: choices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildTabBarView(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: choices.map<Widget>((Choice choice) {
          return Tab(
            child: buildTab(choice),
          );
        }).toList(),
        indicator: const BoxDecoration(),
        onTap: (index) {
          setState(() {});
        },
      ),
    );
  }

  Widget buildTab(Choice choice) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _tabController.index == choices.indexOf(choice)
              ? Colors.orange
              : Colors.transparent,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
        color: _tabController.index == choices.indexOf(choice)
            ? Colors.orange
            : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Icon(
              choice.icon,
              color: _tabController.index == choices.indexOf(choice)
                  ? Colors.white
                  : const Color.fromARGB(255, 74, 74, 74),
            ),
            const SizedBox(width: 10),
            Text(
              choice.title,
              style: TextStyle(
                color: _tabController.index == choices.indexOf(choice)
                    ? Colors.white
                    : const Color.fromARGB(255, 74, 74, 74),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: choices.map<Widget>((Choice choice) {
        return TabContentWidget(
          choice: choice,
        );
      }).toList(),
    );
  }
}
