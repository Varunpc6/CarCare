import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
import 'package:car_maintanance/widgets/home_second_screen/tab_bar.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: choices.map<Widget>((Choice choice) {
            return Tab(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _tabController.index == choices.indexOf(choice)
                        ? Colors.orange // Orange border for selected tab
                        : Colors.orange, // No border for unselected tabs
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: _tabController.index == choices.indexOf(choice)
                      ? Colors.orange // Orange background for selected tab
                      : Colors.white, // White background for unselected tabs
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Icon(
                        choice.icon,
                        color: _tabController.index == choices.indexOf(choice)
                            ? Colors.white // White icon color for selected tab
                            : const Color.fromARGB(255, 74, 74,
                                74), // Black icon color for unselected tabs
                      ),
                      const SizedBox(width: 10),
                      Text(
                        choice.title,
                        style: TextStyle(
                          color: _tabController.index == choices.indexOf(choice)
                              ? Colors
                                  .white // White text color for selected tab
                              : const Color.fromARGB(255, 74, 74,
                                  74), // Black text color for unselected tabs
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
          indicator: const BoxDecoration(), // No indicator
          onTap: (index) {
            setState(() {}); // Update the UI when a tab is tapped
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map<Widget>((Choice choice) {
          return TabContentWidget(choice: choice);
        }).toList(),
      ),
    );
  }
}

class TabContentWidget extends StatelessWidget {
  final Choice choice;

  const TabContentWidget({Key? key, required this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Add your content for each tab here
          // You can use the choice parameter to customize the content based on the selected tab
          // For example:
          Container(
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orange, // Specify the color here
                  width: 1.5, // Specify the width of the border
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                  future: User().getAllDataCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Display a loading indicator while waiting for the future to complete
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Display an error message if the future encounters an error
                      return Text('Error: dhgrj'
                          //     ${snapshot.error}'
                          );
                    } else {
                      // Display the count of total data when the future completes successfully
                      return Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${snapshot.data} entries',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                const Text(
                  '0 entries',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Content for ${choice.title}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Add more widgets based on your requirements
        ],
      ),
    );
  }
}



// import 'package:car_maintanance/core/utils/image_constant.dart';
// import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';
// import 'package:car_maintanance/widgets/home_second_screen/dropdown_widget.dart';
// import 'package:car_maintanance/widgets/home_second_screen/tab_bar.dart';
// import 'package:flutter/cupertino.dart';
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
//                         ? Colors.orange // Orange border for selected tab
//                         : Colors.orange, // No border for unselected tabs
//                     width: 1.5,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                   color: _tabController.index == choices.indexOf(choice)
//                       ? Colors.orange // Orange background for selected tab
//                       : Colors.white, // White background for unselected tabs
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 10, right: 10, top: 5, bottom: 5),
//                   child: Row(
//                     children: [
//                       Icon(
//                         choice.icon,
//                         color: _tabController.index == choices.indexOf(choice)
//                             ? Colors.white // White icon color for selected tab
//                             : const Color.fromARGB(255, 74, 74,
//                                 74), // Black icon color for unselected tabs
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         choice.title,
//                         style: TextStyle(
//                           color: _tabController.index == choices.indexOf(choice)
//                               ? Colors
//                                   .white // White text color for selected tab
//                               : const Color.fromARGB(255, 74, 74,
//                                   74), // Black text color for unselected tabs
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//           indicator: const BoxDecoration(), // No indicator
//           onTap: (index) {
//             setState(() {}); // Update the UI when a tab is tapped
//           },
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: choices.map((Choice choice) {
//           return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
                  // Container(
                  //   height: 45,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Colors.orange, // Specify the color here
                  //         width: 1.5, // Specify the width of the border
                  //       ),
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Text(
                  //         '0 entries',
                  //         style: TextStyle(color: Colors.black),
                  //       ),
                  //       Text(
                  //         "(01/11/2020 - 01/11/2021)",
                  //         style: TextStyle(color: Colors.black),
                  //       ),
                  //     ],
                  //   ),
                  // ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 200,
//                     width: 200,
//                     child: Card(
//                       color: const Color.fromARGB(93, 255, 255, 255),
//                       elevation: 3,
//                       child: Column(children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 100,
//                               height: 100,
//                               child: Image.asset(ImageConstant.defaultImage),
//                             )
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             FutureBuilder(
//                                 future: User().getOdometerSum(),
//                                 builder: (context, snapshot) {
//                                   if (!snapshot.hasData) {
//                                     return const CupertinoActivityIndicator();
//                                   } else {
//                                     return Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Odometer',
//                                           style: TextStyle(color: Colors.black),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           '${snapshot.data}',
//                                           style: const TextStyle(
//                                               color: Colors.black),
//                                         )
//                                       ],
//                                     );
//                                   }
//                                 }),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             FutureBuilder(
//                                 future: User().getAllDataCount(),
//                                 builder: (context, snapshot) {
//                                   if (!snapshot.hasData) {
//                                     return const CupertinoActivityIndicator();
//                                   } else {
//                                     return Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         const Text(
//                                           'Count',
//                                           style: TextStyle(color: Colors.black),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           '${snapshot.data}',
//                                           style: const TextStyle(
//                                               color: Colors.black),
//                                         )
//                                       ],
//                                     );
//                                   }
//                                 }),
//                           ],
//                         ),
//                       ]),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                       height: 90,
//                       width: 350,
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.orange, // Specify the color here
//                             width: 1.5, // Specify the width of the border
//                           ),
//                           borderRadius: BorderRadius.circular(15)),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Text(
//                                 'Chart',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Icon(Icons.chat_rounded),
//                               MyDropdown(),
//                             ],
//                           ),
//                         ],
//                       )),
//                 ],
//               ));
//         }).toList(),
//       ),
//     );
//   }
// }
