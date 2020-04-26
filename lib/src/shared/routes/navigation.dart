import 'package:YGOProdeck/src/features/cards/cards.dart';
import 'package:YGOProdeck/src/features/home/home.dart';
import 'package:flutter/material.dart';

import '../shared.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHome:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
      break;
    case routeCardList:
      return MaterialPageRoute(
        builder: (context) => CardListPage(),
      );
      break;
  }
}
