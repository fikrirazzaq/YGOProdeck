import 'package:flutter/material.dart';

class AtmTextHeading1 extends StatelessWidget {
  final String text;

  const AtmTextHeading1({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ));
  }
}
