import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TmplCardListPage extends StatelessWidget {
  final String title;
  final CardListResponse cards;

  const TmplCardListPage({Key key, this.title, this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: AtmTextHeading4(text: title),
        ),
        Expanded(child: OrgCardList(cards: cards)),
      ],
    );
  }
}
