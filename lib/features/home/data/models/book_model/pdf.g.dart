// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PdfAdapter extends TypeAdapter<Pdf> {
  @override
  final int typeId = 5;

  @override
  Pdf read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pdf(
      isAvailable: fields[0] as bool?,
      acsTokenLink: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pdf obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isAvailable)
      ..writeByte(1)
      ..write(obj.acsTokenLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PdfAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
