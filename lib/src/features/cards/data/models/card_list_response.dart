import 'dart:convert';

import 'models.dart';

class CardListResponse {
  List<CardListData> data;
  Meta meta;

  CardListResponse({
    this.data,
    this.meta,
  });

  factory CardListResponse.fromRawJson(String str) =>
      CardListResponse.fromJson(json.decode(str));

  factory CardListResponse.fromJson(Map<String, dynamic> json) =>
      CardListResponse(
        data: json["data"] == null
            ? null
            : List<CardListData>.from(
                json["data"].map((x) => CardListData.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );
}

class CardListData {
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
  BanlistInfo banlistInfo;
  List<CardImage> cardImages;
  List<CardPrice> cardPrices;

  CardListData({
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
    this.banlistInfo,
    this.cardImages,
    this.cardPrices,
  });

  factory CardListData.fromRawJson(String str) =>
      CardListData.fromJson(json.decode(str));

  factory CardListData.fromJson(Map<String, dynamic> json) => CardListData(
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
        banlistInfo: json["banlist_info"] == null
            ? null
            : BanlistInfo.fromJson(json["banlist_info"]),
        cardImages: json["card_images"] == null
            ? null
            : List<CardImage>.from(
                json["card_images"].map((x) => CardImage.fromJson(x))),
        cardPrices: json["card_prices"] == null
            ? null
            : List<CardPrice>.from(
                json["card_prices"].map((x) => CardPrice.fromJson(x))),
      );
}
