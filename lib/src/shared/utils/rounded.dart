import 'package:flutter/material.dart';

enum Rounded { all, topOnly, bottomOnly, zero }

BorderRadius getBorderRadius(Rounded rounded, double radius) {
  switch (rounded) {
    case Rounded.all:
      return BorderRadius.circular(radius);
      break;
    case Rounded.topOnly:
      return BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      );
      break;
    case Rounded.bottomOnly:
      return BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      );
      break;
    case Rounded.zero:
      return BorderRadius.zero;
      break;
  }
  return null;
}
