// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessInfoAdapter extends TypeAdapter<AccessInfo> {
  @override
  final int typeId = 3;

  @override
  AccessInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessInfo(
      country: fields[0] as String?,
      viewAbility: fields[1] as String?,
      embeddable: fields[2] as bool?,
      publicDomain: fields[3] as bool?,
      textToSpeechPermission: fields[4] as String?,
      pdf: fields[5] as Pdf?,
      webReaderLink: fields[6] as String?,
      accessViewStatus: fields[7] as String?,
      quoteSharingAllowed: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AccessInfo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.viewAbility)
      ..writeByte(2)
      ..write(obj.embeddable)
      ..writeByte(3)
      ..write(obj.publicDomain)
      ..writeByte(4)
      ..write(obj.textToSpeechPermission)
      ..writeByte(5)
      ..write(obj.pdf)
      ..writeByte(6)
      ..write(obj.webReaderLink)
      ..writeByte(7)
      ..write(obj.accessViewStatus)
      ..writeByte(8)
      ..write(obj.quoteSharingAllowed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
