import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
      this.rounded,
      this.radius,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ImageNetworkAtm(
          url: url,
          height: height,
          width: width,
          fit: fit,
          rounded: rounded == null ? Rounded.zero : rounded,
          radius: radius,
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: rounded == null
                ? BorderRadius.zero
                : getBorderRadius(rounded, radius),
          ),
        ),
      ],
    );
  }
}
