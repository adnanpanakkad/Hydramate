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
      dailySteps: fields[1] as int,
      totalSteps: fields[2] as int,
      caloriesBurnedToday: fields[3] as int,
      totalCaloriesBurned: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Userstepdata obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.dailySteps)
      ..writeByte(2)
      ..write(obj.totalSteps)
      ..writeByte(3)
      ..write(obj.caloriesBurnedToday)
      ..writeByte(4)
      ..write(obj.totalCaloriesBurned);
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
