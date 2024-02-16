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
    print(newUser.userName);
    print(registeredBox);
  }

  // Add user fuel
  Future<void> userRegisterAddFuel({
    String? fuel,
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

  // Update operation for fuel
  Future<void> updateFuel(int index, String fuel) async {
    final updatedFuel = User(fuel: fuel);
    await registeredBox.putAt(index, updatedFuel);
  }

  // Delete operation
  Future<void> deleteRegisterDetails(int index) async {
    var deletedUser = registeredBox.getAt(index);
    if (deletedUser != null) {
      print('Deleted user details: $deletedUser');
      await registeredBox.deleteAt(index);
      print('User details deleted successfully');
    } else {
      print('User details not found at index $index');
    }
  }
}

class UserFuel {
  final Box<User> registeredBox2 = Hive.box<User>('AppUserBox');

  // Function to add user registration with some parameters required
  Future<void> fuelAdd({
    required String fuelName,
  }) async {
    final newUser = User(
      fuel: fuelName,
    );
    await registeredBox2.add(newUser);
    print(newUser.fuel);
    print(registeredBox2);
  }

  // Add user fuel
  Future<void> userRegisterAddFuel({
    String? fuel,
  }) async {
    final newUser = User(
      fuel: fuel, // Pass fuel parameter to User constructor
    );
    await registeredBox2.add(newUser);
    print('Fuel added');
  }

  // Read operation
  List<User> displayRegisterDetails() {
    return registeredBox2.values.toList();
    // print("Feul see here");
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
    await registeredBox2.putAt(index, updatedUser);
  }

  // Update operation for fuel
  Future<void> updateFuel(int index, String fuel) async {
    final updatedFuel = User(fuel: fuel);
    await registeredBox2.putAt(index, updatedFuel);
  }

  // Delete operation
  Future<void> deleteRegisterDetails(int index) async {
    var deletedUser = registeredBox2.getAt(index);
    if (deletedUser != null) {
      print('Deleted user details: $deletedUser');
      await registeredBox2.deleteAt(index);
      print('User details deleted successfully');
    } else {
      print('User details not found at index $index');
    }
  }
}
