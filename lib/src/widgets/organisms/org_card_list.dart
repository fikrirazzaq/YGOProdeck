import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../../shared/shared.dart';
import '../widgets.dart';

class OrgCardList extends StatefulWidget {
  final List<CardListData> cards;
  final ScrollController scrollController;
  final bool hasReachedMax;

  const OrgCardList(
      {Key key, this.cards, this.scrollController, this.hasReachedMax})
      : super(key: key);

  @override
  _OrgCardListState createState() => _OrgCardListState();
}

class _OrgCardListState extends State<OrgCardList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildCardListView();
  }

  Widget buildCardListView() {
    return ListView.builder(
      controller: widget.scrollController,
      shrinkWrap: false,
      physics: BouncingScrollPhysics(),
      itemCount:
          widget.hasReachedMax ? widget.cards.length : widget.cards.length + 1,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        if (index >= widget.cards.length) {
          if (widget.cards.length >= 10) {
            return Center(child: AtmPrimaryLoading());
          }
          return Container();
        } else {
          if (widget.cards[index].type.toLowerCase().contains('monster')) {
            return MolMonsterCardInfoItem(
              cardName: widget.cards[index].name,
              cardImageUrl: widget.cards[index].cardImages.first.imageUrl,
              cardAttributeName:
                  widget.cards[index].attribute.toLowerCase().capitalize(),
              cardAttributeImageUrl:
                  cardAttributeIcon(widget.cards[index].attribute),
              cardRaceName: widget.cards[index].race,
              cardRaceImageUrl: cardRaceIcon(widget.cards[index].race),
              cardColor: cardColor(widget.cards[index]),
              atkDef: atkDefList(widget.cards[index]),
              onPressed: () => onNavigateToDetail(context,
                  cardName: widget.cards[index].name),
            );
          } else {
            return MolNonMonsterCardInfoItem(
              cardName: widget.cards[index].name,
              cardImageUrl: widget.cards[index].cardImages.first.imageUrl,
              cardRaceName: widget.cards[index].race,
              cardRaceImageUrl: cardRaceIcon(widget.cards[index].race),
              cardColor: cardColor(widget.cards[index]),
              onPressed: () => onNavigateToDetail(context,
                  cardName: widget.cards[index].name),
            );
          }
        }
      },
    );
  }

  void onNavigateToDetail(context, {@required String cardName}) =>
      Navigator.pushNamed(context, routeCardDetail, arguments: cardName);
}
