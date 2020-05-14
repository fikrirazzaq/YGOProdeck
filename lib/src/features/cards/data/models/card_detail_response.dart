import 'dart:convert';

import 'models.dart';

class CardDetailResponse {
  List<CardDetailData> data;

  CardDetailResponse({
    this.data,
  });

  factory CardDetailResponse.fromRawJson(String str) =>
      CardDetailResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardDetailResponse.fromJson(Map<String, dynamic> json) =>
      CardDetailResponse(
        data: json["data"] == null
            ? null
            : List<CardDetailData>.from(
                json["data"].map((x) => CardDetailData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CardDetailData {
  int id;
  String name;
  String type;
  String desc;
  int atk;
  int def;
  int level;
  String race;
  String attribute;
  String archetype;
  List<CardSet> cardSets;
  List<CardImage> cardImages;
  List<CardPrice> cardPrices;

  CardDetailData({
    this.id,
    this.name,
    this.type,
    this.desc,
    this.atk,
    this.def,
    this.level,
    this.race,
    this.attribute,
    this.archetype,
    this.cardSets,
    this.cardImages,
    this.cardPrices,
  });

  factory CardDetailData.fromRawJson(String str) =>
      CardDetailData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardDetailData.fromJson(Map<String, dynamic> json) => CardDetailData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        desc: json["desc"] == null ? null : json["desc"],
        atk: json["atk"] == null ? null : json["atk"],
        def: json["def"] == null ? null : json["def"],
        level: json["level"] == null ? null : json["level"],
        race: json["race"] == null ? null : json["race"],
        attribute: json["attribute"] == null ? null : json["attribute"],
        archetype: json["archetype"] == null ? null : json["archetype"],
        cardSets: json["card_sets"] == null
            ? null
            : List<CardSet>.from(
                json["card_sets"].map((x) => CardSet.fromJson(x))),
        cardImages: json["card_images"] == null
            ? null
            : List<CardImage>.from(
                json["card_images"].map((x) => CardImage.fromJson(x))),
        cardPrices: json["card_prices"] == null
            ? null
            : List<CardPrice>.from(
                json["card_prices"].map((x) => CardPrice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "desc": desc == null ? null : desc,
        "atk": atk == null ? null : atk,
        "def": def == null ? null : def,
        "level": level == null ? null : level,
        "race": race == null ? null : race,
        "attribute": attribute == null ? null : attribute,
        "archetype": archetype == null ? null : archetype,
        "card_sets": cardSets == null
            ? null
            : List<dynamic>.from(cardSets.map((x) => x.toJson())),
        "card_images": cardImages == null
            ? null
            : List<dynamic>.from(cardImages.map((x) => x.toJson())),
        "card_prices": cardPrices == null
            ? null
            : List<dynamic>.from(cardPrices.map((x) => x.toJson())),
      };
}
