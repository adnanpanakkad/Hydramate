// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserdataModalAdapter extends TypeAdapter<UserdataModal> {
  @override
  final int typeId = 0;

  @override
  UserdataModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserdataModal(
      name: fields[0] as String,
      age: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      imgPath: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserdataModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.imgPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserdataModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
