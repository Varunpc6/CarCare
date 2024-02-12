import 'package:car_maintanance/db/models/db_user_reg/user_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRegisterApp {
  final Box<User> registeredBox = Hive.box<User>('AppUserBox');

  // Function to add user registration with some parameters required
  Future<void> userRegisterAdd({
    required String userName,
    required String carName,
    required String brandName,
    required String modelName,
  }) async {
    final newUser = User(
      userName: userName,
      carName: carName,
      brandName: brandName,
      modelName: modelName,
    );
    await registeredBox.add(newUser);
  }

  // Function to add user registration with only the fuel parameter
  Future<void> userRegisterAddFuel({
    String? fuel, // Make fuel the only parameter
  }) async {
    final newUser = User(
      fuel: fuel, // Pass fuel parameter to User constructor
    );
    await registeredBox.add(newUser);
  }

  // Read operation
  List<User> displayRegisterDetails() {
    return registeredBox.values.toList();
  }

  // Update operation
  Future<void> updateUser(int index, String userName, String carName,
      String brandName, String modelName) async {
    final updatedUser = User(
      userName: userName,
      carName: carName,
      brandName: brandName,
      modelName: modelName,
    );
    await registeredBox.putAt(index, updatedUser);
  }

  // Delete operation
  Future<void> deleteRegisterDetails(int index) async {
    await registeredBox.deleteAt(index);
    // print('====================Delete the user details===================');
  }
}
