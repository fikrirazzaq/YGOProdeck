import 'dart:convert';

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

  String toRawJson() => json.encode(toJson());

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

  Map<String, dynamic> toJson() => {
        "cardmarket_price": cardmarketPrice == null ? null : cardmarketPrice,
        "tcgplayer_price": tcgplayerPrice == null ? null : tcgplayerPrice,
        "ebay_price": ebayPrice == null ? null : ebayPrice,
        "amazon_price": amazonPrice == null ? null : amazonPrice,
        "coolstuffinc_price":
            coolstuffincPrice == null ? null : coolstuffincPrice,
      };
}
