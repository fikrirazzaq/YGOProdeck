import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:hive/hive.dart';

import '../favorites.dart';

class FavoriteDbProvider {
  Box<Favorite> _favoriteBox;

  FavoriteDbProvider() {
    _favoriteBox = Hive.box("favorite_box");
  }

  Future<bool> toggleFavorite(CardDetailData card) async {
    if (_favoriteBox.containsKey(card.id)) {
      await _favoriteBox.delete(card.id);
      return false;
    } else {
      await _favoriteBox.put(
        card.id,
        Favorite(
            name: card.name,
            id: card.id,
            atk: card.atk,
            def: card.def,
            archetype: card.archetype,
            attribute: card.attribute,
            desc: card.desc,
            cardImage: card.cardImages.first.imageUrl,
            level: card.level,
            race: card.race,
            type: card.type),
      );
      return true;
    }
  }

  bool containsFavorite(int cardId) => _favoriteBox.containsKey(cardId);

  Box<Favorite> getBoxValues() => _favoriteBox;
}
