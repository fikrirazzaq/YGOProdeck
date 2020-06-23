import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../../features/favorites/favorites.dart';
import '../../shared/shared.dart';
import '../widgets.dart';

class OrgCardFavoriteList extends StatelessWidget {
  final List<Favorite> cards;

  const OrgCardFavoriteList({Key key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCardListView();
  }

  Widget buildCardListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: cards.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        print("Index $index -- Lenght ${cards.length}");
        if (index >= cards.length) {
          if (cards.length >= 10) {
            return Center(child: AtmPrimaryLoading());
          }
          return Container();
        } else {
          if (cards[index].type.toLowerCase().contains('monster')) {
            return MolMonsterCardInfoItem(
              cardName: cards[index].name,
              cardImageUrl: cards[index].cardImage,
              cardAttributeName:
                  cards[index].attribute.toLowerCase().capitalize(),
              cardAttributeImageUrl: cardAttributeIcon(cards[index].attribute),
              cardRaceName: cards[index].race,
              cardRaceImageUrl: cardRaceIcon(cards[index].race),
              cardColor: cardColor(CardListData(
                  type: cards[index].type, attribute: cards[index].attribute)),
              atkDef: atkDefList(
                  CardListData(atk: cards[index].atk, def: cards[index].def)),
              onPressed: () =>
                  onNavigateToDetail(context, cardName: cards[index].name),
            );
          } else {
            return MolNonMonsterCardInfoItem(
              cardName: cards[index].name,
              cardImageUrl: cards[index].cardImage,
              cardRaceName: cards[index].race,
              cardRaceImageUrl: cardRaceIcon(cards[index].race),
              cardColor: cardColor(CardListData(
                  type: cards[index].type, attribute: cards[index].attribute)),
              onPressed: () =>
                  onNavigateToDetail(context, cardName: cards[index].name),
            );
          }
        }
      },
    );
  }

  void onNavigateToDetail(context, {@required String cardName}) =>
      Navigator.pushNamed(context, routeCardDetail, arguments: cardName);
}
