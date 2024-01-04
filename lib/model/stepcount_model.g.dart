// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepcount_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserstepdataModelAdapter extends TypeAdapter<UserstepdataModel> {
  @override
  final int typeId = 1;

  @override
  UserstepdataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserstepdataModel(
      dailystepCount: fields[1] as String,
      totalSteps: fields[2] as String,
      caloriesBurnedToday: fields[3] as String,
      totalCaloriesBurned: fields[4] as String,
      glasspercent: fields[5] as dynamic,
      waterglass: fields[6] as String, waterglasspercentage: '',
    );
  }

  @override
  void write(BinaryWriter writer, UserstepdataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.dailystepCount)
      ..writeByte(2)
      ..write(obj.totalSteps)
      ..writeByte(3)
      ..write(obj.caloriesBurnedToday)
      ..writeByte(4)
      ..write(obj.totalCaloriesBurned)
      ..writeByte(5)
      ..write(obj.glasspercent)
      ..writeByte(6)
      ..write(obj.waterglass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserstepdataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
