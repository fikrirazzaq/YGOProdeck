import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';

class OrgCardPrices extends StatelessWidget {
  final List<CardPrice> cardPrices;

  const OrgCardPrices({Key key, this.cardPrices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCardPricesWidget(cardPrices);
  }

  Widget buildCardPricesWidget(List<CardPrice> cardPrices) {
    if (cardPrices == null || cardPrices.length == 0) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        Text('Price', style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Table(
          border: TableBorder.all(width: 0, color: Colors.white),
          columnWidths: {0: FractionColumnWidth(.3)},
          children: [
            TableRow(children: [
              Text('Cardmarket'),
              Text('€${cardPrices.first.cardmarketPrice}'),
            ]),
            TableRow(children: [
              Text('CoolStuffInc'),
              Text('\$${cardPrices.first.coolstuffincPrice}'),
            ]),
            TableRow(children: [
              Text('Tcgplayer'),
              Text('\$${cardPrices.first.tcgplayerPrice}'),
            ]),
            TableRow(children: [
              Text('Ebay'),
              Text('\$${cardPrices.first.ebayPrice}'),
            ]),
            TableRow(children: [
              Text('Amazon'),
              Text('\$${cardPrices.first.amazonPrice}'),
            ]),
          ],
        ),
      ],
    );
  }
}
