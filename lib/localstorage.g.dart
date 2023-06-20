// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localstorage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalstorageAdapter extends TypeAdapter<Localstorage> {
  @override
  final int typeId = 1;

  @override
  Localstorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Localstorage(
      name: fields[7] as String?,
      suggestedBatterySize: fields[5] as String,
      calculatedBatterySize: fields[4] as String,
      ILBC: fields[1] as String,
      ILDC: fields[0] as String,
      inverterSize: fields[6] as String,
      Iscc: fields[2] as String,
      spv: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Localstorage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.ILDC)
      ..writeByte(1)
      ..write(obj.ILBC)
      ..writeByte(2)
      ..write(obj.Iscc)
      ..writeByte(3)
      ..write(obj.spv)
      ..writeByte(4)
      ..write(obj.calculatedBatterySize)
      ..writeByte(5)
      ..write(obj.suggestedBatterySize)
      ..writeByte(6)
      ..write(obj.inverterSize)
      ..writeByte(7)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalstorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
