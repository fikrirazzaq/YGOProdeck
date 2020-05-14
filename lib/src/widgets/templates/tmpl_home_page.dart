import 'package:flutter/material.dart';

import '../../features/home/home.dart';
import '../widgets.dart';
import '../../shared/shared.dart';

class TmplHomePage extends StatelessWidget {
  final String headerImageUrl;
  final String headerTitle;
  final String headerSubtitle;
  final String searchHint;
  final List<MainMenuData> mainMenuList;
  final Function(int) mainMenuBuilder;

  const TmplHomePage(
      {Key key,
      this.headerImageUrl,
      this.headerTitle,
      this.headerSubtitle,
      this.searchHint,
      this.mainMenuList,
      this.mainMenuBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          OrgHomeHeader(
            imageUrl: headerImageUrl,
            title: headerTitle,
            subtitle: headerSubtitle,
            searchHint: searchHint,
          ),
          SizedBox(height: 30),
          OrgMainMenu(
            mainMenuList: mainMenuList,
            mainMenuBuilder: (index) => MolMainMenuItem(
              imageUrl: mainMenuList[index].imageUrl,
              title: mainMenuList[index].title,
              onPressed: () => _navigate(context, index),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void _navigate(context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(routeAllCardList);
        break;
      case 1:
        Navigator.of(context).pushNamed(routeSpellCardList);
        break;
      case 2:
        Navigator.of(context).pushNamed(routeTrapCardList);
        break;
      case 3:
        Navigator.of(context).pushNamed(routeSkillCardList);
        break;
      default:
        Navigator.of(context).pushNamed(routeAllCardList);
        break;
    }
  }
}
