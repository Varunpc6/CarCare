// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_main_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainBoxUserAdapter extends TypeAdapter<MainBoxUser> {
  @override
  final int typeId = 1;

  @override
  MainBoxUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainBoxUser(
      userName: fields[0] as String?,
      carName: fields[1] as String?,
      brandName: fields[2] as String?,
      modelName: fields[3] as String?,
      fuel: fields[4] as String?,
      image: fields[5] as String?,
      fuelCapacity: fields[6] as String?,
      sFuel: fields[7] as String?,
      sFuelCapacity: fields[8] as String?,
      note: fields[9] as String?,
      expenses: (fields[10] as List?)?.cast<ExpenseModel>(),
      refuels: (fields[11] as List?)?.cast<RefuelModel>(),
      services: (fields[12] as List?)?.cast<ServiceModel>(),
    )
      ..route = (fields[13] as List?)?.cast<RouteModel>()
      ..income = (fields[14] as List?)?.cast<IncomeModel>();
  }

  @override
  void write(BinaryWriter writer, MainBoxUser obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.carName)
      ..writeByte(2)
      ..write(obj.brandName)
      ..writeByte(3)
      ..write(obj.modelName)
      ..writeByte(4)
      ..write(obj.fuel)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.fuelCapacity)
      ..writeByte(7)
      ..write(obj.sFuel)
      ..writeByte(8)
      ..write(obj.sFuelCapacity)
      ..writeByte(9)
      ..write(obj.note)
      ..writeByte(10)
      ..write(obj.expenses)
      ..writeByte(11)
      ..write(obj.refuels)
      ..writeByte(12)
      ..write(obj.services)
      ..writeByte(13)
      ..write(obj.route)
      ..writeByte(14)
      ..write(obj.income);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainBoxUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
