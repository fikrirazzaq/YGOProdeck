import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:meta/meta.dart';

class CardRepository {
  final CardApiProvider cardApiProvider;

  CardRepository({@required this.cardApiProvider})
      : assert(cardApiProvider != null);

  Future<CardListResponse> fetchCardList({int num, int offset}) {
    return cardApiProvider.fetchCardList(
        offset: offset.toString(), num: num.toString());
  }
}
