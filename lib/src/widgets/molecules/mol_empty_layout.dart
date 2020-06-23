import 'package:flutter/material.dart';

class MolEmptyLayout extends StatelessWidget {
  final IconData icon;
  final Widget desc;

  MolEmptyLayout({Key key, this.icon, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 60.0,
            color: Colors.grey[400],
          ),
        ),
        desc
      ],
    );
  }
}
