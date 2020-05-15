
import 'dart:convert';

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