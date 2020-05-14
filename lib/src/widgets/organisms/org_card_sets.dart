import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../widgets.dart';

class OrgCardSets extends StatelessWidget {
  final List<CardSet> cardSets;

  const OrgCardSets({Key key, this.cardSets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCardSetsWidget(cardSets);
  }

  Widget buildCardSetsWidget(List<CardSet> cardSets) {
    if (cardSets == null || cardSets.length == 0) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        Text('Available in', style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 4),
        Container(
          height: 124,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cardSets.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                child: Card(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${cardSets[index].setName}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('${cardSets[index].setCode}'),
                            Expanded(child: Container()),
                            Text('€${cardSets[index].setPrice}'),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(4)),
                          ),
                          child: AtmTextHeading3(
                              text: cardSets[index]
                                  .setRarityCode
                                  .replaceAll('(', '')
                                  .replaceAll(')', '')),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
