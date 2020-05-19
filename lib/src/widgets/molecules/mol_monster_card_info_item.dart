import 'package:flutter/material.dart';

import '../widgets.dart';

class MolMonsterCardInfoItem extends StatelessWidget {
  final String cardName;
  final String cardImageUrl;
  final String cardAttributeName;
  final String cardAttributeImageUrl;
  final String cardRaceName;
  final String cardRaceImageUrl;
  final Color cardColor;
  final String atkDef;
  final VoidCallback onPressed;

  const MolMonsterCardInfoItem(
      {Key key,
      this.cardName,
      this.cardImageUrl,
      this.cardAttributeName,
      this.cardAttributeImageUrl,
      this.cardColor,
      this.cardRaceName,
      this.cardRaceImageUrl,
      this.atkDef,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 136,
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        onTap: onPressed,
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
                              imageUrl: cardRaceImageUrl,
                              name: cardRaceName,
                            ),
                            MolClipLabelRace(
                              imageUrl: cardAttributeImageUrl,
                              name: cardAttributeName,
                            ),
                          ],
                        ),
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
                child: AtmTextHeading3(text: atkDef),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
