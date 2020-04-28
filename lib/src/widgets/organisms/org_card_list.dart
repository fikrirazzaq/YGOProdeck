import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:YGOProdeck/src/widgets/atoms/atm_primary_loading.dart';
import 'package:YGOProdeck/src/widgets/molecules/mol_monster_card_info_item.dart';
import 'package:YGOProdeck/src/widgets/molecules/mol_nonmonster_card_info_item.dart';
import 'package:flutter/material.dart';

class OrgCardList extends StatelessWidget {
  final List<CardListData> cards;
  final ScrollController scrollController;
  final bool hasReachedMax;

  const OrgCardList(
      {Key key, this.cards, this.scrollController, this.hasReachedMax})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      shrinkWrap: false,
      physics: BouncingScrollPhysics(),
      itemCount: hasReachedMax ? cards.length : cards.length + 1,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (index >= cards.length) {
          return Center(child: AtmPrimaryLoading());
        } else {
          if (cards[index].type.toLowerCase().contains('monster')) {
            return MolMonsterCardInfoItem(
              cardName: cards[index].name,
              cardImageUrl: cards[index].cardImages.first.imageUrl,
              cardAttributeName:
                  cards[index].attribute.toLowerCase().capitalize(),
              cardAttributeImageUrl: cardAttributeIcon(cards[index].attribute),
              cardRaceName: cards[index].race,
              cardRaceImageUrl: cardRaceIcon(cards[index].race),
              cardColor: cardColor(cards[index]),
              atkDef: atkDef(cards[index]),
            );
          } else {
            return MolNonMonsterCardInfoItem(
              cardName: cards[index].name,
              cardImageUrl: cards[index].cardImages.first.imageUrl,
              cardRaceName: cards[index].race,
              cardRaceImageUrl: cardRaceIcon(cards[index].race),
              cardColor: cardColor(cards[index]),
            );
          }
        }
      },
    );
  }
}
