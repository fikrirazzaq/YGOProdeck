import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TmplCardList extends StatelessWidget {
  final List<CardListData> cards;
  final ScrollController scrollController;
  final bool hasReachedMax;

  const TmplCardList(
      {Key key, this.cards, this.scrollController, this.hasReachedMax})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrgCardList(
      cards: cards,
      hasReachedMax: hasReachedMax,
      scrollController: scrollController,
    );
  }
}
