import 'package:flutter/material.dart';

class AtmTextHeading3 extends StatelessWidget {
  final String text;

  const AtmTextHeading3({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ));
  }
}
