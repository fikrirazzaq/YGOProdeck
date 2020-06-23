import 'package:hive/hive.dart';

import '../favorites.dart';

class FavoriteDbProvider {
  Box<Favorite> _favoriteBox;

  FavoriteDbProvider() {
    _favoriteBox = Hive.box("favorite_box");
  }

  Future<void> toggleFavorite(Favorite card) async {
    if (_favoriteBox.containsKey(card.name)) {
      await _favoriteBox.delete(card.name);
    } else {
      await _favoriteBox.put(card.name, card);
    }
  }

  bool containsFavorite(String cardName) => _favoriteBox.containsKey(cardName);

  Box<Favorite> getBoxValues() => _favoriteBox;
}
