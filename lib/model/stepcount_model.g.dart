// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepcount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserstepdataAdapter extends TypeAdapter<Userstepdata> {
  @override
  final int typeId = 2;

  @override
  Userstepdata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Userstepdata(
      dailystepCount: fields[1] as String,
      totalSteps: fields[2] as String,
      caloriesBurnedToday: fields[3] as String,
      totalCaloriesBurned: fields[4] as String,
      dateIsToday: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Userstepdata obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.dailystepCount)
      ..writeByte(2)
      ..write(obj.totalSteps)
      ..writeByte(3)
      ..write(obj.caloriesBurnedToday)
      ..writeByte(4)
      ..write(obj.totalCaloriesBurned)
      ..writeByte(5)
      ..write(obj.dateIsToday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserstepdataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
