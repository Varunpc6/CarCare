// Container(
//           height: 80,
//           width: 500,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 15),
//                 child: CircleAvatar(
//                   backgroundColor: myColor,
//                   radius: 28,
//                   child: const CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.white,
//                     child: Icon(
//                       Icons.directions_car,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'What do people call you?',
//                         labelText: 'Name *',
//                         labelStyle:
//                             TextStyle(color: myColor), // Set label text color
//                         hintStyle: TextStyle(
//                             color: Colors.black), // Set hint text color

//                         hoverColor: myColor,
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors
//                                   .orange), // Set border color when focused
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Colors
//                                   .black), // Set border color when not focused
//                         ),
//                       ),
//                       onSaved: (String? value) {},
//                       validator: (String? value) {
//                         return (value != null && value.contains('@'))
//                             ? 'Do not use the @ char.'
//                             : null;
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),