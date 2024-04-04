import 'dart:io';
import 'package:car_maintanance/hive_main/db/models/reminder_db/reminder_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IncomePlan {
  final Box<ReminderModel> incomeInitialBox =
      Hive.box<ReminderModel>('income_box');

// Add
  Future<void> addIncome({
    String? expense,
    String? service,
    int? odometer,
    String? date,
    String? reason,
    int? id,
  }) async {
    final newReminder = ReminderModel(
      expense: expense,
      service: service,
      odometer: odometer,
      date: date,
      reason: reason,
    );
    await incomeInitialBox.add(newReminder);

    stdout.write('$incomeInitialBox\n');
    stdout.write('Income Added ${newReminder.date}\n');
  }

// Read
  List<ReminderModel> displayIncome() {
    return incomeInitialBox.values.toList();
  }

// Update
  Future<void> updateIncome({
    String? expense,
    String? service,
    int? odometer,
    String? date,
    String? reason,
    int? index,
  }) async {
    final updateincome = ReminderModel(
      expense: expense,
      service: service,
      odometer: odometer,
      date: date,
      reason: reason,
    );
    await incomeInitialBox.add(updateincome);
    await incomeInitialBox.putAt(index!, updateincome);
  }

// Delete
  Future<void> deleteIncome(int index) async {
    var deletedIncome = incomeInitialBox.getAt(index);
    if (deletedIncome != null) {
      // print('Deleted user details: $deletedUser');
      await incomeInitialBox.deleteAt(index);
      stdout.write('User details deleted successfully');
    } else {
      // print('User details not found at index $index');
    }
  }
}
