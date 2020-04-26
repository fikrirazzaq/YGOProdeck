import 'package:YGOProdeck/src/features/home/home.dart';
import 'package:YGOProdeck/src/shared/shared.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => Navigator.of(context).pushNamed(routeCardList),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
