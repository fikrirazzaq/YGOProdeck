import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:meta/meta.dart';

class CardRepository {
  final CardApiProvider cardApiProvider;

  CardRepository({@required this.cardApiProvider})
      : assert(cardApiProvider != null);

  Future<CardListResponse> fetchCardList() {
    return cardApiProvider.fetchCardList();
  }
}
