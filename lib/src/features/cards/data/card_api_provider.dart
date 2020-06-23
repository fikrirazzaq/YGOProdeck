import 'package:dio/dio.dart';

import '../../../shared/shared.dart';
import '../cards.dart';

class CardApiProvider {
  ApiClient _api = ApiClient();

  Future<CardListResponse> fetchAllCardList(
      {String num, String offset, CardQueryParams queryParams}) async {
    final Map<String, String> query = {};
    query['num'] = num;
    query['offset'] = offset;

    queryParams.type != '' ? query['type'] = queryParams.type : null;
    queryParams.level != '' ? query['level'] = queryParams.level : null;
    queryParams.race != '' ? query['race'] = queryParams.race : null;
    queryParams.attribute != ''
        ? query['attribute'] = queryParams.attribute
        : null;
    queryParams.atk != '' ? query['atk'] = queryParams.atk : null;
    queryParams.def != '' ? query['def'] = queryParams.def : null;
    queryParams.banlist != '' ? query['banlist'] = queryParams.banlist : null;
    queryParams.sort != '' ? query['sort'] = queryParams.sort : null;

    Response response = await _api.getRequest(card, queryParams: query);
    CardListResponse res = CardListResponse.fromJson(response.data);
    return res;
  }

  Future<CardListResponse> fetchSearchCard(
      {String keyword, String num, String offset}) async {
    Response response = await _api.getRequest(card,
        queryParams: {"num": num, "offset": offset, "fname": keyword});
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
