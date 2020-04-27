import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:YGOProdeck/src/widgets/molecules/mol_monster_card_info_item.dart';
import 'package:YGOProdeck/src/widgets/molecules/mol_nonmonster_card_info_item.dart';
import 'package:flutter/material.dart';

class OrgCardList extends StatelessWidget {
  final CardListResponse cards;

  const OrgCardList({Key key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      physics: BouncingScrollPhysics(),
      itemCount: cards.data.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (cards.data[index].type.toLowerCase().contains('monster')) {
          return MolMonsterCardInfoItem(
            cardName: cards.data[index].name,
            cardImageUrl: cards.data[index].cardImages.first.imageUrl,
            cardAttributeName:
                cards.data[index].attribute.toLowerCase().capitalize(),
            cardAttributeImageUrl:
                cardAttributeIcon(cards.data[index].attribute),
            cardRaceName: cards.data[index].race,
            cardRaceImageUrl: cardRaceIcon(cards.data[index].race),
            cardColor: cardColor(cards.data[index]),
            atkDef: atkDef(cards.data[index]),
          );
        } else {
          return MolNonMonsterCardInfoItem(
            cardName: cards.data[index].name,
            cardImageUrl: cards.data[index].cardImages.first.imageUrl,
            cardRaceName: cards.data[index].race,
            cardRaceImageUrl: cardRaceIcon(cards.data[index].race),
            cardColor: cardColor(cards.data[index]),
          );
        }
      },
    );
  }
}
