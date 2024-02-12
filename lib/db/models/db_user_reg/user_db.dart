import 'package:hive/hive.dart';
part 'user_db.g.dart';

@HiveType(typeId: 0)
class User {
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

  User({
    this.userName,
    this.carName,
    this.brandName,
    this.modelName,
    this.fuel,
  });
}
