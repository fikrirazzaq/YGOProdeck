import 'package:flutter/material.dart';

import '../widgets.dart';
import '../../shared/shared.dart';

class MolImageDark extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final Rounded rounded;
  final double radius;
  final BoxFit fit;

  const MolImageDark(
      {Key key,
      this.url,
      this.height,
      this.width,
      this.rounded = Rounded.zero,
      this.radius,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AtmImageNetwork(
          url: url,
          height: height,
          width: width,
          fit: fit,
          rounded: rounded,
          radius: radius,
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: getBorderRadius(rounded, radius),
          ),
        ),
      ],
    );
  }
}
