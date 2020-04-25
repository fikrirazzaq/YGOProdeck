import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrgHomeHeader extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String searchHint;

  const OrgHomeHeader(
      {Key key, this.imageUrl, this.title, this.subtitle, this.searchHint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        MolImageDark(
          url: imageUrl,
          height: 250,
          width: double.infinity,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: Center(
            child: MolTitleHome(
              title: title,
              subtitle: subtitle,
            ),
          ),
        ),
        Positioned(
          bottom: -22,
          left: 20,
          right: 20,
          child: MolSearchBox(
            hint: searchHint,
          ),
        ),
      ],
    );
  }
}
