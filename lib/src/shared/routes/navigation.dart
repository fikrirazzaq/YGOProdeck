import 'package:flutter/material.dart';

import '../shared.dart';
import '../../features/home/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHome:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
  }
}
