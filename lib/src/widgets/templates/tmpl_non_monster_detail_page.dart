import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../widgets.dart';

class TmplNonMonsterDetailPage extends StatelessWidget {
  final CardDetailLoaded state;

  const TmplNonMonsterDetailPage({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 16),
        AtmImageNetwork(
          url: state.card.cardImages.first.imageUrl,
          height: MediaQuery.of(context).size.height * 0.25,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16),
        AtmTextHeading4(text: '${state.card.name}'),
        SizedBox(height: 8),
        MolMonsterLevel(level: state.card.level),
        SizedBox(height: 8),
        MolCardAttribute(cardDetailData: state.card, isMonster: false),
        SizedBox(height: 16),
        Text('${state.card.desc}'),
        OrgCardPrices(cardPrices: state.card.cardPrices),
        OrgCardSets(cardSets: state.card.cardSets),
        OrgCardImages(cardImages: state.card.cardImages),
        SizedBox(height: 16),
      ],
    );
  }
}
