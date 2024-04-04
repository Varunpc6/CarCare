// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderModelAdapter extends TypeAdapter<ReminderModel> {
  @override
  final int typeId = 7;

  @override
  ReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderModel(
      expense: fields[0] as String?,
      service: fields[1] as String?,
      odometer: fields[2] as int?,
      date: fields[3] as String?,
      reason: fields[4] as String?,
    )..id = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.expense)
      ..writeByte(1)
      ..write(obj.service)
      ..writeByte(2)
      ..write(obj.odometer)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.reason)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
