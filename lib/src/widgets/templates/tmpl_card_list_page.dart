import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TmplCardListPage extends StatelessWidget {
  final CardListResponse cards;

  const TmplCardListPage({Key key, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrgCardList(cards: cards);
  }
}
