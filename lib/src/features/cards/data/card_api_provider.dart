import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:dio/dio.dart';

class CardApiProvider {
  ApiClient _api = ApiClient();

  Future<CardListResponse> fetchCardList() async {
    Response response = await _api.getRequest(card);
    CardListResponse res = CardListResponse.fromJson(response.data);
    return res;
  }
}
