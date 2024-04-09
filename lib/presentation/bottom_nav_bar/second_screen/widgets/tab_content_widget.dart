import 'package:car_maintanance/hive_main/db/db_functions/second_user_form.dart';
import 'package:car_maintanance/presentation/bottom_nav_bar/second_screen/models/choice.dart';
import 'package:flutter/material.dart';

// class TabContentWidget extends StatelessWidget {
//   final Choice choice;

//   const TabContentWidget({
//     Key? key,
//     required this.choice,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 125,
//                 width: 125,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   borderRadius: BorderRadius.circular(80),
//                   border: Border.all(
//                     width: 5,
//                     color: Colors.orange,
//                   ),
//                 ),
//                 child: Center(child: FutureCountWidget(choice: choice)),
//               ),
//               Container(
//                 height: 125,
//                 width: 125,
//                 decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 255, 255, 255),
//                     borderRadius: BorderRadius.circular(80),
//                     border: Border.all(
//                       width: 5,
//                       color: Colors.orange,
//                     )),
//                 child: Center(child: FutureOdometerWidget(choice: choice)),
//               ),
//             ],
//           ),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     FutureCountWidget(choice: choice),
//           //     FutureOdometerWidget(choice: choice),
//           //   ],
//           // ),
//           const SizedBox(height: 20),
//           Container(
//             height: 150,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: AssetImage(ImageConstant.reminderImg),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: const Center(
//               child: Text(
//                 "data",
//                 style: TextStyle(color: Colors.orange),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           // Add more widgets based on your requirements
//         ],
//       ),
//     );
//   }
// }

class TabContentWidget extends StatelessWidget {
  final Choice choice;

  // Define a map that associates each choice title with a list of corresponding functions
  final Map<String, List<Future<int> Function()>> functionMap = {
    'General': [
      () => SecUser().getAllDataCount(),
      () => SecUser().getTotalRefuelPrice()
    ],
    'Refuel': [() => SecUser().getTotalRefuelPrice()],
    'Expense': [() => SecUser().getAllDataCount()],
    'Income': [() => SecUser().getAllDataCount()],
    'Service': [() => SecUser().getAllDataCount()],
    'Route': [() => SecUser().getAllDataCount()],
  };

  TabContentWidget({Key? key, required this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the list of functions associated with the selected choice title
    List<Future<int> Function()> selectedFunctions =
        functionMap[choice.title] ?? [];

    // Call each function and collect the futures
    List<Future<int>> futures = [];
    for (var function in selectedFunctions) {
      futures.add(function());
    }

    return Column(
      children: [
        // Build UI components based on the results obtained from each future
        for (var future in futures)
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a loading indicator while waiting for the future to complete
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Display an error message if the future encounters an error
                return Text('Error: ${snapshot.error}');
              } else {
                // Display the result obtained from the future
                return buildContent(snapshot.data);
              }
            },
          ),
      ],
    );
  }

  Widget buildContent(int? data) {
    // Build and return the UI content based on the data received from the future
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 50,
              maxWidth: 500,
              minHeight: 50,
              minWidth: 250,
            ),
            child: Center(
              child: Text(
                "${data.toString()} entries",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Text(
            "Cost",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          ListTile(
            title: FutureBuilder(
              future: SecUser().getAllDataCount(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while waiting for the future to complete
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Display an error message if the future encounters an error
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display the result obtained from the future
                  final total = snapshot.data.toString();
                  return ListTile(
                    title: const Text(
                      "Total",
                      style: TextStyle(
                        color: Color.fromARGB(107, 0, 0, 0),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "$total km",
                      style: const TextStyle(
                        color: Color.fromARGB(202, 0, 0, 0),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const Divider(
            thickness: 2.0, // Thickness of the divider
          ),
          const Text(
            "Distance",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
          ListTile(
            title: FutureBuilder(
              future: SecUser().getTotalRefuelPrice(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while waiting for the future to complete
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Display an error message if the future encounters an error
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display the result obtained from the future
                  final total = snapshot.data.toString();
                  return ListTile(
                    title: const Text(
                      "Total",
                      style: TextStyle(
                        color: Color.fromARGB(107, 0, 0, 0),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "$total km",
                      style: const TextStyle(
                        color: Color.fromARGB(202, 0, 0, 0),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const Divider(
            thickness: 2.0, // Thickness of the divider
          ),
        ],
      ),
    );
  }
}
