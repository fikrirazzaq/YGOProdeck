import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageNetworkAtm extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final Rounded rounded;
  final double radius;
  final BoxFit fit;

  const ImageNetworkAtm(
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
    return kIsWeb
        ? ClipRRect(
            borderRadius: rounded == null
                ? BorderRadius.zero
                : getBorderRadius(rounded, radius),
            child: Image.network(
              url,
              height: height,
              width: width,
              fit: fit == null ? BoxFit.cover : fit,
            ),
          )
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, image) {
              return Ink(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: rounded == null
                      ? BorderRadius.zero
                      : getBorderRadius(rounded, radius),
                  image: DecorationImage(
                    image: image,
                    fit: fit == null ? BoxFit.cover : fit,
                  ),
                ),
              );
            },
          );
  }
}
