import 'package:meta/meta.dart';

import '../cards.dart';

class CardRepository {
  final CardApiProvider cardApiProvider;

  CardRepository({@required this.cardApiProvider})
      : assert(cardApiProvider != null);

  Future<CardListResponse> fetchAllCardList({int num, int offset, CardQueryParams queryParams}) {
    return cardApiProvider.fetchAllCardList(
        offset: offset.toString(), num: num.toString(), queryParams: queryParams);
  }

  Future<CardListResponse> fetchTrapCardList({int num, int offset}) {
    return cardApiProvider.fetchTrapCardList(
        offset: offset.toString(), num: num.toString());
  }

  Future<CardListResponse> fetchSpellCardList({int num, int offset}) {
    return cardApiProvider.fetchSpellCardList(
        offset: offset.toString(), num: num.toString());
  }

  Future<CardListResponse> fetchSkillCardList({int num, int offset}) {
    return cardApiProvider.fetchSkillCardList(
        offset: offset.toString(), num: num.toString());
  }

  Future<CardDetailResponse> fetchCardDetail({String cardName}) {
    return cardApiProvider.fetchCardDetail(cardName: cardName);
  }
}
