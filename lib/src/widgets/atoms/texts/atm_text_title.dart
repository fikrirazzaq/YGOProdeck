import 'package:flutter/material.dart';

class AtmTextTitle extends StatelessWidget {
  final String text;

  const AtmTextTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
