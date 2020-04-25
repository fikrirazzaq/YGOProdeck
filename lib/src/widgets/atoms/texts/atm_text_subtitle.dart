import 'package:flutter/material.dart';

class AtmTextSubtitle extends StatelessWidget {
  final String text;

  const AtmTextSubtitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.white));
  }
}
