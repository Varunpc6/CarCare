import 'package:car_maintanance/core/utils/app_colors.dart';
import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:car_maintanance/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CurrentCarScreen extends StatelessWidget {
  const CurrentCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Background Image Rising on TextField click time
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whitesf5,
        body: SizedBox(
            width: ResSize.width(context),
            height: ResSize.height(context),
            child:
                Container() // ********************Container temp**************
            // const Stack(
            //   children: [
            //     BgImage(), // Background Image
            //     AppBarCurrentSrn(), // AppBar
            //     CarListCurrentSn(), // CarList
            //   ],
            // ),
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onTap(context);
          },
          backgroundColor: AppColors.white,
          child: const Icon(
            Icons.directions_car_sharp,
            size: 26,
            color: AppColors.orange,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
    );
  }

  // click Next Button
  onTap(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editCarScreen);
  }
}





// Positioned(
//                 left: ResSize.left03(context), // Adjusted for responsiveness
//                 top: ResSize.top033(context),
//                 child: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         width: 35,
//                         height: 35,
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(50)),
//                           color: AppColors.white,
//                           border: Border.all(
//                             width: 2.5,
//                             color: AppColors.orange,
//                           ),
//                         ),
//                         child: const Icon(
//                           Icons.arrow_back,
//                           color: AppColors.black,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 25,
//                     ),
//                     const Text(
//                       'Car Details',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

              // Positioned(
              //   left: ResSize.left22(context), // Adjusted for responsiveness
              //   top: ResSize.top04(context),
              //   child: const Row(
              //     children: [
              //       Text(
              //         'Car Details',
              //         style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.w800,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container


// Positioned(
//   right: ResSize.right15(context),
//   left: MediaQuery.of(context).size.width * 0.06,
//   top: MediaQuery.of(context).size.height * 0.15,
//   child: SizedBox(
//     width: MediaQuery.of(context).size.width *
//         0.8, // Adjusted for responsiveness
//     height: MediaQuery.of(context).size.height * 0.1,
//     child: TextField(
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: const Color.fromARGB(255, 242, 246, 250),
//         hintText: 'Search',
//         hintStyle:
//             const TextStyle(color: Color.fromARGB(117, 0, 0, 0)),
//         border: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.orange),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.orange),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       ),
//     ),
//   ),
// ),
// Positioned(
//   top: MediaQuery.of(context).size.height * 0.25,
//   left: MediaQuery.of(context).size.width *
//       0.06, // Adjusted for responsiveness
//   right: MediaQuery.of(context).size.width * 0.06,
//   child: SizedBox(
//     width: MediaQuery.of(context).size.width *
//         0.8, // Adjusted for responsiveness
//     height: MediaQuery.of(context).size.height * 0.1,
//     child: Column(
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width *
//               0.9, // Adjusted for responsiveness
//           height: MediaQuery.of(context).size.height * 0.07,
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color:
//                     Colors.orange), // Border color set to orange
//             borderRadius:
//                 BorderRadius.circular(10.0), // Adjust as needed
//             color: const Color.fromARGB(
//                 208, 242, 242, 242), // Background color
//           ),
//           child: const Center(
//             child: ListTile(
//               leading: Icon(
//                 Icons.directions_car,
//                 color: Colors.black,
//               ),
//               title: Text(
//                 'Car Model Name',
//                 style: TextStyle(
//                   color: Color.fromARGB(225, 43, 26, 0),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
