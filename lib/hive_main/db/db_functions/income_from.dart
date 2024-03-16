// import 'dart:io';
// import 'package:car_maintanance/hive_main/db/models/income_db/income_db.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class IncomePlan {
//   final Box<IncomeModel> incomeInitialBox = Hive.box<IncomeModel>('income_box');

// // Add
//   Future<void> addIncome({
//     String? date,
//     String? time,
//     int? odometer,
//     String? income,
//     int? value,
//     String? paymentMethod,
//     String? note,
//   }) async {
//     final newIncome = IncomeModel(
//       date: date,
//       time: time,
//       odometer: odometer,
//       income: income,
//       value: value,
//       paymentMethod: paymentMethod,
//       note: note,
//     );
//     await incomeInitialBox.add(newIncome);
//     stdout.write('${newIncome.income}\n');
//     stdout.write('$incomeInitialBox\n');
//     stdout.write('Income Added ${newIncome.date}\n');
//   }

// // Read
//   List<IncomeModel> displayIncome() {
//     return incomeInitialBox.values.toList();
//   }

// // Update
//   Future<void> updateIncome({
//     int? index,
//     String? date,
//     String? time,
//     int? odometer,
//     String? income,
//     int? value,
//     String? paymentMethod,
//     String? note,
//   }) async {
//     final updateincome = IncomeModel(
//       date: date,
//       time: time,
//       odometer: odometer,
//       income: income,
//       value: value,
//       paymentMethod: paymentMethod,
//       note: note,
//     );
//     await incomeInitialBox.add(updateincome);
//     await incomeInitialBox.putAt(index!, updateincome);
//   }

// // Delete
//   Future<void> deleteIncome(int index) async {
//     var deletedIncome = incomeInitialBox.getAt(index);
//     if (deletedIncome != null) {
//       // print('Deleted user details: $deletedUser');
//       await incomeInitialBox.deleteAt(index);
//       stdout.write('User details deleted successfully');
//     } else {
//       // print('User details not found at index $index');
//     }
//   }
// }
