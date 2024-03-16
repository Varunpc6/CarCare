// import 'dart:io';
// import 'package:car_maintanance/hive_main/db/models/expense_db/expense_db.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class ExpensePlan {
//   final Box<ExpenseModel> expenseInitialBox =
//       Hive.box<ExpenseModel>('expense_box');

// // Add
//   Future<void> addExpense({
//     String? date,
//     String? time,
//     int? odometer,
//     String? fuelType,
//     String? place,
//     String? paymentMethod,
//     String? reason,
//   }) async {
//     final newExpense = ExpenseModel(
//       date: date,
//       time: time,
//       odometer: odometer,
//       fuelType: fuelType,
//       place: place,
//       paymentMethod: paymentMethod,
//       reason: reason,
//     );
//     await expenseInitialBox.add(newExpense);
//     stdout.write('${newExpense.time}\n');
//     stdout.write('$expenseInitialBox\n');
//     stdout.write('Expense Added ${newExpense.odometer}\n');
//   }

// // Read
//   List<ExpenseModel> displayExpense() {
//     return expenseInitialBox.values.toList();
//   }

// // Update
//   Future<void> updateExpense({
//     int? index,
//     String? date,
//     String? time,
//     int? odometer,
//     String? fuelType,
//     String? paymentMethod,
//     String? reason,
//   }) async {
//     final updateExpense = ExpenseModel(
//       date: date,
//       time: time,
//       odometer: odometer,
//       fuelType: fuelType,
//       paymentMethod: paymentMethod,
//       reason: reason,
//     );
//     await expenseInitialBox.add(updateExpense);
//     await expenseInitialBox.putAt(index!, updateExpense);
//   }

// // Delete
//   Future<void> deleteExpense(int index) async {
//     var deletedExpense = expenseInitialBox.getAt(index);
//     if (deletedExpense != null) {
//       // print('Deleted user details: $deletedUser');
//       await expenseInitialBox.deleteAt(index);
//       stdout.write('User details deleted successfully');
//     } else {
//       // print('User details not found at index $index');
//     }
//   }
// }
