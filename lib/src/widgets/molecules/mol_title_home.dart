import 'package:flutter/material.dart';

import '../widgets.dart';

class MolTitleHome extends StatelessWidget {
  final String title;
  final String subtitle;

  const MolTitleHome({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AtmTextTitle(text: 'Yu-Gi-Oh! Database'),
        SizedBox(height: 4),
        AtmTextSubtitle(text: 'by YGOPRODECK'),
      ],
    );
  }
}
