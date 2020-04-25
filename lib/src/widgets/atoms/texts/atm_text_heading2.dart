import 'package:flutter/material.dart';

class AtmTextHeading2 extends StatelessWidget {
  final String text;

  const AtmTextHeading2({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.black54));
  }
}
