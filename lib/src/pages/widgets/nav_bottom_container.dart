// import 'package:flutter/material.dart';

// // class TankWidget extends StatefulWidget {
// //   const TankWidget({Key? key}) : super(key: key);

// //   @override
// //   _TankWidgetState createState() => _TankWidgetState();
// // }

// class _TankWidgetState extends State<TankWidget> {
//   bool isTappedFirst = false;
//   bool isTappedSecond = false;

//   void _toggleFirst() {
//     setState(() {
//       isTappedFirst = !isTappedFirst;
//       isTappedSecond = false; // Reset second container on tap of first
//     });
//   }

//   void _toggleSecond() {
//     setState(() {
//       isTappedSecond = !isTappedSecond;
//       isTappedFirst = false; // Reset first container on tap of second
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 500,
//       height: 50,
//       color: const Color.fromRGBO(98, 94, 94, 100),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: _toggleFirst,
//               child: Container(
//                 color: isTappedFirst
//                     ? Colors.blueAccent
//                     : const Color.fromRGBO(98, 94, 94, 100),
//                 child: const Center(child: Text('Single tank')),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GestureDetector(
//               onTap: _toggleSecond,
//               child: Container(
//                 color: isTappedSecond
//                     ? Colors.blueAccent
//                     : const Color.fromRGBO(98, 94, 94, 100),
//                 child: const Center(child: Text('Secondary tank')),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
