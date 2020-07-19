import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../features/home/home.dart';
import '../../shared/shared.dart';
import '../widgets.dart';

class TmplHomePage extends StatefulWidget {
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
  _TmplHomePageState createState() => _TmplHomePageState();
}

class _TmplHomePageState extends State<TmplHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          OrgHomeHeader(
            imageUrl: widget.headerImageUrl,
            title: widget.headerTitle,
            subtitle: widget.headerSubtitle,
            searchHint: widget.searchHint,
          ),
          SizedBox(height: 30),
          OrgMainMenu(
            mainMenuList: widget.mainMenuList,
            mainMenuBuilder: (index) => MolMainMenuItem(
              imageUrl: widget.mainMenuList[index].imageUrl,
              title: widget.mainMenuList[index].title,
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
        Navigator.pushNamed(context, routeAllCardList);
        break;
      case 1:
        Fluttertoast.showToast(msg: 'Not yet ready.');
        break;
      case 2:
        Fluttertoast.showToast(msg: 'Not yet ready.');
        break;
      default:
        Navigator.pushNamed(context, routeAllCardList);
        break;
    }
  }
}
