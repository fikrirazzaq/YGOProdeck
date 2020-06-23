import 'package:flutter/material.dart';

import '../widgets.dart';

class MolNonMonsterCardInfoItem extends StatelessWidget {
  final String cardName;
  final String cardImageUrl;
  final String cardRaceName;
  final String cardRaceImageUrl;
  final Color cardColor;
  final VoidCallback onPressed;

  const MolNonMonsterCardInfoItem(
      {Key key,
      this.cardName,
      this.cardImageUrl,
      this.cardRaceName,
      this.cardRaceImageUrl,
      this.cardColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        child: Container(
          height: 136,
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
                          MolClipLabelRace(
                            imageUrl: cardRaceImageUrl,
                            name: cardRaceName,
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
            ],
          ),
        ),
      ),
    );
  }
}
