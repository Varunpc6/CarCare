// import 'package:car_maintanance/presentation/bottom_nav_bar/second_screen/models/choice.dart';
// import 'package:flutter/material.dart';
// import 'package:car_maintanance/hive_main/db/db_functions/user_from.dart';

// class FutureOdometerWidget extends StatelessWidget {
//   final Choice choice;

//   const FutureOdometerWidget({Key? key, required this.choice})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: User().getOdometerSum(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return const Text(
//             'Error: No Values',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           );
//         } else if (snapshot.hasData) {
//           return SizedBox(
//             width: 200,
//             child: ListTile(
//               leading: const Icon(Icons.speed),
//               title: Text(
//                 'Total Odometer: ${snapshot.data}',
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return const Text(
//             'No data available',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           );
//         }
//       },
//     );
//   }
// }
