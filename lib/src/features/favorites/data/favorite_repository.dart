import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../favorites.dart';

class FavoriteRepository {
  final FavoriteDbProvider favoriteDbProvider;

  FavoriteRepository({@required this.favoriteDbProvider})
      : assert(favoriteDbProvider != null);

  Box<Favorite> getFavoriteValues() => favoriteDbProvider.getBoxValues();

  Future<void> toggleFavorite(Favorite card) async {
    await favoriteDbProvider.toggleFavorite(card);
  }

  bool containsFavorite(String cardName) =>
      favoriteDbProvider.containsFavorite(cardName);
}
