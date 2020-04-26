import 'package:flutter/material.dart';

class AtmTextHeading4 extends StatelessWidget {
  final String text;

  const AtmTextHeading4({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ));
  }
}
