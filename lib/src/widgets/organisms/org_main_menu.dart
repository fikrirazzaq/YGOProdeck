import 'package:flutter/material.dart';

import '../../features/home/home.dart';

class OrgMainMenu extends StatelessWidget {
  final Function(int) mainMenuBuilder;
  final List<MainMenuData> mainMenuList;

  const OrgMainMenu({Key key, this.mainMenuBuilder, this.mainMenuList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: ((MediaQuery.of(context).size.width - 40) / 2) / 162,
      children: List.generate(mainMenuList.length, mainMenuBuilder),
    );
  }
}
