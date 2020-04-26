import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MolCardInfoItem extends StatelessWidget {
  final String cardName;
  final String cardImageUrl;
  final String cardAttributeName;
  final String cardAttributeImageUrl;
  final Color cardColor;

  const MolCardInfoItem(
      {Key key,
      this.cardName,
      this.cardImageUrl,
      this.cardAttributeName,
      this.cardAttributeImageUrl,
      this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ImageNetworkAtm(
                              url: cardAttributeImageUrl,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 8),
                            AtmTextHeading3(
                              text: cardAttributeName,
                            ),
                          ],
                        ),
                      )
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
            child: ImageNetworkAtm(
              url: cardImageUrl,
              width: 140,
            ),
          )
        ],
      ),
    );
  }
}
