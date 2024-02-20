// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuel_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RefuelAdapter extends TypeAdapter<Refuel> {
  @override
  final int typeId = 0;

  @override
  Refuel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Refuel(
      fuelDate: fields[0] as String?,
      fuelTime: fields[1] as String?,
      fuelOdomerter: fields[2] as String?,
      fuelType: fields[3] as String?,
      fuelPrice: fields[4] as String?,
      fuelStation: fields[5] as String?,
      fuelPayment: fields[6] as String?,
      fuelReason: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Refuel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.fuelDate)
      ..writeByte(1)
      ..write(obj.fuelTime)
      ..writeByte(2)
      ..write(obj.fuelOdomerter)
      ..writeByte(3)
      ..write(obj.fuelType)
      ..writeByte(4)
      ..write(obj.fuelPrice)
      ..writeByte(5)
      ..write(obj.fuelStation)
      ..writeByte(6)
      ..write(obj.fuelPayment)
      ..writeByte(7)
      ..write(obj.fuelReason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefuelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
