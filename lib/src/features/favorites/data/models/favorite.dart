import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(typeId: 1)
class Favorite {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String desc;

  @HiveField(4)
  final int atk;

  @HiveField(5)
  final int def;

  @HiveField(6)
  final int level;

  @HiveField(7)
  final String race;

  @HiveField(8)
  final String attribute;

  @HiveField(9)
  final String archetype;

  @HiveField(10)
  final String cardImage;

  Favorite({
    this.name,
    this.id,
    this.type,
    this.desc,
    this.atk,
    this.def,
    this.level,
    this.race,
    this.attribute,
    this.archetype,
    this.cardImage,
  });
}
