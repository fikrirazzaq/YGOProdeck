import 'package:flutter/material.dart';

import '../widgets.dart';
import '../../shared/shared.dart';

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
            AtmImageNetwork(
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
