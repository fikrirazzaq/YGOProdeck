import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MolMonsterCardInfoItem extends StatelessWidget {
  final String cardName;
  final String cardImageUrl;
  final String cardAttributeName;
  final String cardAttributeImageUrl;
  final String cardRaceName;
  final String cardRaceImageUrl;
  final Color cardColor;
  final String atkDef;

  const MolMonsterCardInfoItem(
      {Key key,
      this.cardName,
      this.cardImageUrl,
      this.cardAttributeName,
      this.cardAttributeImageUrl,
      this.cardColor,
      this.cardRaceName,
      this.cardRaceImageUrl,
      this.atkDef})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(4)),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AtmTextHeading1(text: cardName),
                      SizedBox(height: 12),
                      Wrap(
                        runSpacing: 4,
                        spacing: 4,
                        children: <Widget>[
                          MolClipLabelRace(
                            imageUrl: cardAttributeImageUrl,
                            name: cardAttributeName,
                          ),
                          MolClipLabelRace(
                            imageUrl: cardRaceImageUrl,
                            name: cardRaceName,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      AtmTextHeading3(text: atkDef),
                    ],
                  ),
                ),
                SizedBox(width: 164),
              ],
            ),
          ),
          Positioned(
            bottom: -80,
            right: 8,
            child: AtmImageNetwork(
              url: cardImageUrl,
              width: 140,
            ),
          )
        ],
      ),
    );
  }
}
