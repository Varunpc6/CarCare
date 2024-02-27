// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainUserAdapter extends TypeAdapter<MainUser> {
  @override
  final int typeId = 0;

  @override
  MainUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainUser(
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
    );
  }

  @override
  void write(BinaryWriter writer, MainUser obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
