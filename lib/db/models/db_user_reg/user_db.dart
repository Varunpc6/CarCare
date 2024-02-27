import 'package:hive_flutter/hive_flutter.dart';

part 'user_db.g.dart';

@HiveType(typeId: 0)
class MainUser {
  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? carName;

  @HiveField(2)
  String? brandName;

  @HiveField(3)
  String? modelName;

  @HiveField(4)
  String? fuel;

  @HiveField(5)
  String? image;

  @HiveField(6)
  String? fuelCapacity;

  @HiveField(7)
  String? sFuel;

  @HiveField(8)
  String? sFuelCapacity;

  @HiveField(9)
  String? note;

  MainUser({
    this.userName,
    this.carName,
    this.brandName,
    this.modelName,
    this.fuel,
    this.image,
    this.fuelCapacity,
    this.sFuel,
    this.sFuelCapacity,
    this.note,
  });
}

// import 'package:hive/hive.dart';



// @HiveType(typeId: 1) // incresed
// class User {
//   @HiveField(0)
//   String? userName;

//   @HiveField(1)
//   String? carName;

//   @HiveField(2)
//   String? brandName;

//   @HiveField(3)
//   String? modelName;

//   @HiveField(4)
//   String? fuel;

//   @HiveField(5)
//   String? image;

//   @HiveField(6)
//   String? fuelCapacity;

//   @HiveField(7)
//   String? sFuel;

//   @HiveField(8)
//   String? sFuelCapacity;

//   @HiveField(9)
//   String? note;

//   User({
    // this.userName,
    // this.carName,
    // this.brandName,
    // this.modelName,
    // this.fuel,
    // this.image,
    // this.fuelCapacity,
    // this.sFuel,
    // this.sFuelCapacity,
    // this.note,
//   });
// }
