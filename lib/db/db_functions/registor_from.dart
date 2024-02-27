import 'package:car_maintanance/db/models/db_user_reg/user_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRegisterApp {
  // final Box<User> registeredBox = Hive.box<User>('AppUserBox');
  final Box<MainUser> registeredBox = Hive.box<MainUser>('BoxMain');
  // Function to add user registration with some parameters
  Future<void> userRegisterAdd({
    String? userName,
    String? carName,
    String? brandName,
    String? modelName,
    String? fuel,
    String? image,
    String? fuelCapacity,
    String? sFuel,
    String? sFuelCapacity,
    String? note,
    
  }) async {
    final newUser = MainUser(
      userName: userName,
      carName: carName,
      brandName: brandName,
      modelName: modelName,
      fuel: fuel,
      image: image,
      fuelCapacity: fuelCapacity,
      sFuel: sFuel,
      sFuelCapacity: sFuelCapacity,
      note: note,
    );
    await registeredBox.add(newUser);
    print(newUser.userName);
    print(registeredBox);
    print('image added ${newUser.image}');
  }

  // Read operation
  List<MainUser> displayRegisterDetails() {
    return registeredBox.values.toList();
  }

  // Update operation
  Future<void> updateUser({
    int? index,
    String? userName,
    String? carName,
    String? brandName,
    String? modelName,
    String? fuel,
    String? image,
    String? fuelCapacity,
    String? sFuel,
    String? sFuelCapacity,
    String? note,
  }) async {
    final updatedUser = MainUser(
      userName: userName,
      carName: carName,
      brandName: brandName,
      modelName: modelName,
      fuel: fuel,
      image: image,
      fuelCapacity: fuelCapacity,
      sFuel: sFuel,
      sFuelCapacity: sFuelCapacity,
      note: note,
    );
    await registeredBox.putAt(index!, updatedUser);
  }

  // Delete operation
  Future<void> deleteRegisterDetails(int index) async {
    var deletedUser = registeredBox.getAt(index);
    if (deletedUser != null) {
      // print('Deleted user details: $deletedUser');
      await registeredBox.deleteAt(index);
      print('User details deleted successfully');
    } else {
      // print('User details not found at index $index');
    }
  }
}
