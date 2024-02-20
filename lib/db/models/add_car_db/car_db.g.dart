// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAdapter extends TypeAdapter<Car> {
  @override
  final int typeId = 0;

  @override
  Car read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Car(
      car: fields[0] as String?,
      brand: fields[1] as String?,
      model: fields[2] as String?,
      mainFuelType: fields[3] as String?,
      mainFuelCapacity: fields[4] as int?,
      secondFuelType: fields[5] as String?,
      secondFuelCapacity: fields[6] as int?,
      note: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Car obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.car)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.mainFuelType)
      ..writeByte(4)
      ..write(obj.mainFuelCapacity)
      ..writeByte(5)
      ..write(obj.secondFuelType)
      ..writeByte(6)
      ..write(obj.secondFuelCapacity)
      ..writeByte(7)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
