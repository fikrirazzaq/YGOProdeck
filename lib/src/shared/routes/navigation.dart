import 'package:flutter/material.dart';

import '../../features/home/home.dart';
import '../../features/cards/cards.dart';
import '../shared.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeHome:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
      break;
    case routeAllCardList:
      return MaterialPageRoute(
        builder: (context) => AllCardListPage(),
      );
      break;
    case routeTrapCardList:
      return MaterialPageRoute(
        builder: (context) => TrapCardListPage(),
      );
      break;
    case routeSpellCardList:
      return MaterialPageRoute(
        builder: (context) => SpellCardListPage(),
      );
      break;
    case routeSkillCardList:
      return MaterialPageRoute(
        builder: (context) => SkillCardListPage(),
      );
      break;
    case routeCardDetail:
      CardListData card = settings.arguments as CardListData;
      return MaterialPageRoute(
        builder: (context) => CardDetailPage(card: card),
      );
      break;
  }
}
