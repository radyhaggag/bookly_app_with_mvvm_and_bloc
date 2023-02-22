// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListPriceAdapter extends TypeAdapter<ListPrice> {
  @override
  final int typeId = 6;

  @override
  ListPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListPrice(
      amount: fields[0] as double?,
      currencyCode: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ListPrice obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.currencyCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
