import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../widgets.dart';
import '../../shared/shared.dart';

class OrgCardList extends StatelessWidget {
  final List<CardListData> cards;
  final ScrollController scrollController;
  final bool hasReachedMax;

  const OrgCardList(
      {Key key, this.cards, this.scrollController, this.hasReachedMax})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCardListView(),
        buildFilterButton(context),
      ],
    );
  }

  Widget buildCardListView() {
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
              atkDef: atkDefList(cards[index]),
              onPressed: () => onNavigateToDetail(context, card: cards[index]),
            );
          } else {
            return MolNonMonsterCardInfoItem(
              cardName: cards[index].name,
              cardImageUrl: cards[index].cardImages.first.imageUrl,
              cardRaceName: cards[index].race,
              cardRaceImageUrl: cardRaceIcon(cards[index].race),
              cardColor: cardColor(cards[index]),
              onPressed: () => onNavigateToDetail(context, card: cards[index]),
            );
          }
        }
      },
    );
  }

  Widget buildFilterButton(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: MolFilterFloatingButton(
        onFilterPressed: () {
          ShowBottomSheet.filterCards(context, onPressedButton: () {});
        },
        onSortPressed: () {
          ShowBottomSheet.sortCards(context, onPressedButton: () {});
        },
      ),
    );
  }

  void onNavigateToDetail(context, {@required CardListData card}) =>
      Navigator.of(context).pushNamed(routeCardDetail, arguments: card);
}
