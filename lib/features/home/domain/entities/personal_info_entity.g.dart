// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalInfoEntityAdapter extends TypeAdapter<PersonalInfoEntity> {
  @override
  final int typeId = 0;

  @override
  PersonalInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalInfoEntity(
      imagePerson: fields[0] as String?,
      namePerson: fields[1] as String?,
      emailPerson: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalInfoEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.imagePerson)
      ..writeByte(1)
      ..write(obj.namePerson)
      ..writeByte(2)
      ..write(obj.emailPerson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
