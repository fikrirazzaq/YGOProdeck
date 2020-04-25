import 'package:flutter/material.dart';

class AtmTextNormal extends StatelessWidget {
  final String text;

  const AtmTextNormal({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.black));
  }
}
