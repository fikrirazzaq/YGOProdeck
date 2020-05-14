import 'dart:convert';

class CardSet {
  String setName;
  String setCode;
  String setRarity;
  String setRarityCode;
  String setPrice;

  CardSet({
    this.setName,
    this.setCode,
    this.setRarity,
    this.setRarityCode,
    this.setPrice,
  });

  factory CardSet.fromRawJson(String str) => CardSet.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CardSet.fromJson(Map<String, dynamic> json) => CardSet(
        setName: json["set_name"] == null ? null : json["set_name"],
        setCode: json["set_code"] == null ? null : json["set_code"],
        setRarity: json["set_rarity"] == null ? null : json["set_rarity"],
        setRarityCode:
            json["set_rarity_code"] == null ? null : json["set_rarity_code"],
        setPrice: json["set_price"] == null ? null : json["set_price"],
      );

  Map<String, dynamic> toJson() => {
        "set_name": setName == null ? null : setName,
        "set_code": setCode == null ? null : setCode,
        "set_rarity": setRarity == null ? null : setRarity,
        "set_rarity_code": setRarityCode == null ? null : setRarityCode,
        "set_price": setPrice == null ? null : setPrice,
      };
}
