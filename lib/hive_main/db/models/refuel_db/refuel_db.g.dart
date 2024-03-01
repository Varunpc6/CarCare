// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refuel_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RefuelModelAdapter extends TypeAdapter<RefuelModel> {
  @override
  final int typeId = 4;

  @override
  RefuelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RefuelModel(
      date: fields[0] as String?,
      time: fields[1] as String?,
      odometer: fields[2] as int?,
      typeFuel: fields[3] as String?,
      price: fields[4] as int?,
      totalCost: fields[5] as int?,
      gallon: fields[6] as int?,
      paymentMethod: fields[7] as String?,
      reason: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RefuelModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.odometer)
      ..writeByte(3)
      ..write(obj.typeFuel)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.totalCost)
      ..writeByte(6)
      ..write(obj.gallon)
      ..writeByte(7)
      ..write(obj.paymentMethod)
      ..writeByte(8)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefuelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
