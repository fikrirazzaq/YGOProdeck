import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class AtmImageNetwork extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final Rounded rounded;
  final double radius;
  final BoxFit fit;

  const AtmImageNetwork(
      {Key key,
      @required this.url,
      this.height,
      this.width,
      this.rounded = Rounded.zero,
      this.radius,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? ClipRRect(
            borderRadius: getBorderRadius(rounded, radius),
            child: Image.network(
              url,
              height: height,
              width: width,
              fit: fit,
            ),
          )
        : ClipRRect(
            borderRadius: getBorderRadius(rounded, radius),
            child: Container(
              height: height,
              width: width,
              child: CachedNetworkImage(
                imageUrl: url,
                fit: fit,
              ),
            ),
          );
  }
}
