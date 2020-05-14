import 'package:flutter/material.dart';

class AtmText16 extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final int maxLines;
  final bool isSoftWrap;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final TextDirection textDirection;

  const AtmText16(
      {Key key,
        @required this.text,
        this.textStyle,
        this.maxLines,
        this.isSoftWrap,
        this.textAlign,
        this.textOverflow,
        this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle?.copyWith(fontSize: 16.0) ??
          TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
      maxLines: maxLines,
      softWrap: isSoftWrap,
      textAlign: textAlign,
      overflow: textOverflow,
      key: key,
      textDirection: textDirection,
    );
  }
}
