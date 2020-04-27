import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MolClipLabelRace extends StatelessWidget {
  final String imageUrl;
  final String name;

  const MolClipLabelRace({Key key, this.imageUrl, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AtmImageNetwork(
            url: imageUrl,
            height: 20,
            width: 20,
          ),
          SizedBox(width: 8),
          AtmTextHeading3(
            text: name,
          ),
        ],
      ),
    );
  }
}
