import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MolMainMenuItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onPressed;

  const MolMainMenuItem({Key key, this.imageUrl, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Column(
          children: <Widget>[
            ImageNetworkAtm(
              url: imageUrl,
              height: 120,
              width: double.infinity,
              rounded: Rounded.topOnly,
              radius: 4,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: AtmTextNormal(text: title),
            ),
          ],
        ),
      ),
    );
  }
}
