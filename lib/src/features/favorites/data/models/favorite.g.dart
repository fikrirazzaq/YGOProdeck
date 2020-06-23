// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteAdapter extends TypeAdapter<Favorite> {
  @override
  final typeId = 1;

  @override
  Favorite read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favorite(
      name: fields[0] as String,
      id: fields[1] as int,
      type: fields[2] as String,
      desc: fields[3] as String,
      atk: fields[4] as int,
      def: fields[5] as int,
      level: fields[6] as int,
      race: fields[7] as String,
      attribute: fields[8] as String,
      archetype: fields[9] as String,
      cardImage: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Favorite obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.atk)
      ..writeByte(5)
      ..write(obj.def)
      ..writeByte(6)
      ..write(obj.level)
      ..writeByte(7)
      ..write(obj.race)
      ..writeByte(8)
      ..write(obj.attribute)
      ..writeByte(9)
      ..write(obj.archetype)
      ..writeByte(10)
      ..write(obj.cardImage);
  }
}
