// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RouteModelAdapter extends TypeAdapter<RouteModel> {
  @override
  final int typeId = 5;

  @override
  RouteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RouteModel(
      origin: fields[0] as String?,
      startDate: fields[1] as String?,
      startTime: fields[2] as String?,
      initialOdometer: fields[3] as int?,
      destination: fields[4] as String?,
      endDate: fields[5] as String?,
      endTime: fields[6] as String?,
      finalOdometer: fields[7] as int?,
      total: fields[8] as int?,
      paymentMethod: fields[9] as String?,
      reason: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RouteModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.origin)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.initialOdometer)
      ..writeByte(4)
      ..write(obj.destination)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.endTime)
      ..writeByte(7)
      ..write(obj.finalOdometer)
      ..writeByte(8)
      ..write(obj.total)
      ..writeByte(9)
      ..write(obj.paymentMethod)
      ..writeByte(10)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
