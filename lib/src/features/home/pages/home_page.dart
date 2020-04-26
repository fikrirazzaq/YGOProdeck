import 'package:YGOProdeck/src/features/home/home.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:flutter/material.dart';

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
    MainMenuData(
      title: 'All Sets',
      imageUrl: imgBuilder,
    ),
    MainMenuData(
      title: 'Monster Cards',
      imageUrl: imgMonster,
    ),
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
