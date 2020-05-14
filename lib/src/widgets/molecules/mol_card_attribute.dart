import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../../shared/shared.dart';
import '../widgets.dart';

class MolCardAttribute extends StatelessWidget {
  final CardDetailData cardDetailData;
  final bool isMonster;

  const MolCardAttribute({Key key, this.cardDetailData, this.isMonster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildAttributeInfo(isMonster, cardDetailData);
  }

  Widget buildAttributeInfo(bool isMonster, CardDetailData cardDetail) {
    if (isMonster) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AtmImageNetwork(
                  url: cardRaceIcon(cardDetail.race), height: 20, width: 20),
              SizedBox(width: 8),
              Text('${cardDetail.race}'),
            ],
          ),
          SizedBox(width: 16),
          AtmImageNetwork(
              url: cardAttributeIcon(cardDetail.attribute),
              height: 20,
              width: 20),
          SizedBox(width: 8),
          Text('${cardDetail.attribute.toLowerCase().capitalize()}'),
          SizedBox(width: 8),
          Text('${atkDefDetail(cardDetail)}')
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AtmImageNetwork(
              url: cardRaceIcon(cardDetail.race), height: 20, width: 20),
          SizedBox(width: 8),
          Text('${cardDetail.race}'),
        ],
      );
    }
  }
}
