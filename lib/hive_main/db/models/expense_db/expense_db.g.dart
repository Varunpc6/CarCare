// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseModelAdapter extends TypeAdapter<ExpenseModel> {
  @override
  final int typeId = 2;

  @override
  ExpenseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseModel(
      date: fields[0] as String?,
      time: fields[1] as String?,
      odometer: fields[2] as int?,
      fuelType: fields[3] as String?,
      place: fields[4] as String?,
      paymentMethod: fields[5] as String?,
      reason: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.odometer)
      ..writeByte(3)
      ..write(obj.fuelType)
      ..writeByte(4)
      ..write(obj.place)
      ..writeByte(5)
      ..write(obj.paymentMethod)
      ..writeByte(6)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
