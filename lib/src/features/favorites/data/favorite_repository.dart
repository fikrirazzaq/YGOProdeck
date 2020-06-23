import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../favorites.dart';

class FavoriteRepository {
  final FavoriteDbProvider favoriteDbProvider;

  FavoriteRepository({@required this.favoriteDbProvider})
      : assert(favoriteDbProvider != null);

  Box<Favorite> getFavoriteValues() => favoriteDbProvider.getBoxValues();

  Future<bool> toggleFavorite(CardDetailData card) async =>
      await favoriteDbProvider.toggleFavorite(card);

  bool containsFavorite(int cardId) =>
      favoriteDbProvider.containsFavorite(cardId);
}
