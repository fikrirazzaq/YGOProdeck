import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TmplHomePage(
        headerImageUrl: puzzleBackground,
        headerTitle: 'Yu-Gi-Oh! Database',
        headerSubtitle: 'by YGOPRODECK',
        searchHint: 'Search for cards...',
        mainMenuList: mainMenuList,
      ),
    );
  }

  List<MainMenuData> mainMenuList = [
    MainMenuData(
      title: 'All Cards',
      imageUrl: imgCards,
    ),
//    MainMenuData(
//      title: 'All Sets',
//      imageUrl: imgBuilder,
//    ),
//    MainMenuData(
//      title: 'Monster Cards',
//      imageUrl: imgMonster,
//    ),
    MainMenuData(
      title: 'Spell Cards',
      imageUrl: imgArticle,
    ),
    MainMenuData(
      title: 'Trap Cards',
      imageUrl: imgSpell,
    ),
    MainMenuData(
      title: 'Skill Cards',
      imageUrl: imgDeck,
    ),
  ];
}
