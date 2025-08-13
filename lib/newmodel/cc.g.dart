// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cc.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ccAdapter extends TypeAdapter<cc> {
  @override
  final int typeId = 0;

  @override
  cc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return cc(
      name: fields[0] as String,
      lastname: fields[1] as String,
      phonenumber: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, cc obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastname)
      ..writeByte(2)
      ..write(obj.phonenumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ccAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
