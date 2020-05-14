import 'package:dio/dio.dart';

import '../cards.dart';
import '../../../shared/shared.dart';

class CardApiProvider {
  ApiClient _api = ApiClient();

  Future<CardListResponse> fetchAllCardList({String num, String offset}) async {
    Response response = await _api.getRequest(card, queryParams: {
      "num": num,
      "offset": offset,
    });
    CardListResponse res = CardListResponse.fromJson(response.data);
    return res;
  }

  Future<CardListResponse> fetchTrapCardList(
      {String num, String offset}) async {
    Response response = await _api.getRequest(card,
        queryParams: {"num": num, "offset": offset, "type": "Trap Card"});
    CardListResponse res = CardListResponse.fromJson(response.data);
    return res;
  }

  Future<CardListResponse> fetchSpellCardList(
      {String num, String offset}) async {
    Response response = await _api.getRequest(card, queryParams: {
      "num": num,
      "offset": offset,
      "type": "Spell Card",
    });
    CardListResponse res = CardListResponse.fromJson(response.data);
    return res;
  }

  Future<CardListResponse> fetchSkillCardList(
      {String num, String offset}) async {
    Response response = await _api.getRequest(card,
        queryParams: {"num": num, "offset": offset, "type": "Skill Card"});
    CardListResponse res = CardListResponse.fromJson(response.data);
    return res;
  }

  Future<CardDetailResponse> fetchCardDetail({String cardName}) async {
    Response response =
        await _api.getRequest(card, queryParams: {"name": cardName});
    CardDetailResponse res = CardDetailResponse.fromJson(response.data);
    return res;
  }
}
