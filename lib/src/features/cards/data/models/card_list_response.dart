import 'dart:convert';

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
            : List<CardListData>.from(json["data"].map((x) => CardListData.fromJson(x))),
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

  factory CardListData.fromRawJson(String str) => CardListData.fromJson(json.decode(str));

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

class BanlistInfo {
  String banTcg;
  String banOcg;

  BanlistInfo({
    this.banTcg,
    this.banOcg,
  });

  factory BanlistInfo.fromRawJson(String str) =>
      BanlistInfo.fromJson(json.decode(str));

  factory BanlistInfo.fromJson(Map<String, dynamic> json) => BanlistInfo(
        banTcg: json["ban_tcg"] == null ? null : json["ban_tcg"],
        banOcg: json["ban_ocg"] == null ? null : json["ban_ocg"],
      );
}

class CardImage {
  int id;
  String imageUrl;
  String imageUrlSmall;

  CardImage({
    this.id,
    this.imageUrl,
    this.imageUrlSmall,
  });

  factory CardImage.fromRawJson(String str) =>
      CardImage.fromJson(json.decode(str));

  factory CardImage.fromJson(Map<String, dynamic> json) => CardImage(
        id: json["id"] == null ? null : json["id"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        imageUrlSmall:
            json["image_url_small"] == null ? null : json["image_url_small"],
      );
}

class CardPrice {
  String cardmarketPrice;
  String tcgplayerPrice;
  String ebayPrice;
  String amazonPrice;
  String coolstuffincPrice;

  CardPrice({
    this.cardmarketPrice,
    this.tcgplayerPrice,
    this.ebayPrice,
    this.amazonPrice,
    this.coolstuffincPrice,
  });

  factory CardPrice.fromRawJson(String str) =>
      CardPrice.fromJson(json.decode(str));

  factory CardPrice.fromJson(Map<String, dynamic> json) => CardPrice(
        cardmarketPrice:
            json["cardmarket_price"] == null ? null : json["cardmarket_price"],
        tcgplayerPrice:
            json["tcgplayer_price"] == null ? null : json["tcgplayer_price"],
        ebayPrice: json["ebay_price"] == null ? null : json["ebay_price"],
        amazonPrice: json["amazon_price"] == null ? null : json["amazon_price"],
        coolstuffincPrice: json["coolstuffinc_price"] == null
            ? null
            : json["coolstuffinc_price"],
      );
}

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

  factory CardSet.fromJson(Map<String, dynamic> json) => CardSet(
        setName: json["set_name"] == null ? null : json["set_name"],
        setCode: json["set_code"] == null ? null : json["set_code"],
        setRarity: json["set_rarity"] == null ? null : json["set_rarity"],
        setRarityCode:
            json["set_rarity_code"] == null ? null : json["set_rarity_code"],
        setPrice: json["set_price"] == null ? null : json["set_price"],
      );
}

class Meta {
  int currentRows;
  int totalRows;
  int rowsRemaining;
  int totalPages;
  int pagesRemaining;
  String previousPage;
  int previousPageOffset;
  String nextPage;
  int nextPageOffset;

  Meta({
    this.currentRows,
    this.totalRows,
    this.rowsRemaining,
    this.totalPages,
    this.pagesRemaining,
    this.previousPage,
    this.previousPageOffset,
    this.nextPage,
    this.nextPageOffset,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentRows: json["current_rows"] == null ? null : json["current_rows"],
        totalRows: json["total_rows"] == null ? null : json["total_rows"],
        rowsRemaining:
            json["rows_remaining"] == null ? null : json["rows_remaining"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        pagesRemaining:
            json["pages_remaining"] == null ? null : json["pages_remaining"],
        previousPage:
            json["previous_page"] == null ? null : json["previous_page"],
        previousPageOffset: json["previous_page_offset"] == null
            ? null
            : json["previous_page_offset"],
        nextPage: json["next_page"] == null ? null : json["next_page"],
        nextPageOffset:
            json["next_page_offset"] == null ? null : json["next_page_offset"],
      );
}
