import 'package:flutter/material.dart';

import '../../features/_main_menu/main_menu.dart';
import '../../features/cards/cards.dart';
import '../shared.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routeMain:
      return MaterialPageRoute(
        builder: (context) => MainMenuPage(),
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
      String cardName = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => CardDetailPage(cardName: cardName),
      );
      break;
  }
}
