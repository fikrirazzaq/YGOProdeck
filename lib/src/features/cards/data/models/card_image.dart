import 'dart:convert';

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

  String toRawJson() => json.encode(toJson());

  factory CardImage.fromJson(Map<String, dynamic> json) => CardImage(
        id: json["id"] == null ? null : json["id"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        imageUrlSmall:
            json["image_url_small"] == null ? null : json["image_url_small"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image_url": imageUrl == null ? null : imageUrl,
        "image_url_small": imageUrlSmall == null ? null : imageUrlSmall,
      };
}
