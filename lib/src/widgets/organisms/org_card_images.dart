import 'package:flutter/material.dart';

import '../../features/cards/cards.dart';
import '../widgets.dart';

class OrgCardImages extends StatelessWidget {
  final List<CardImage> cardImages;

  const OrgCardImages({Key key, this.cardImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCardImagesWidget(cardImages);
  }

  Widget buildCardImagesWidget(List<CardImage> cardImages) {
    if (cardImages == null || cardImages.length <= 1) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        Text('Other Images', style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Container(
          height: 180,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cardImages.length - 1,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: AtmImageNetwork(
                  url: cardImages[index + 1].imageUrl,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
