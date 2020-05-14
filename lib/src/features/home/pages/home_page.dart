import 'package:flutter/material.dart';

import '../home.dart';
import '../../../widgets/widgets.dart';
import '../../../shared/shared.dart';

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
//      bottomNavigationBar: BottomNavigationBar(
//        selectedItemColor: Colors.black54,
//        items: [
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.bookmark), title: Text('Saved')),
//        ],
//      ),
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
