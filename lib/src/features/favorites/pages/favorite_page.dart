import 'package:YGOProdeck/src/widgets/organisms/org_card_favorite_list.dart';
import 'package:YGOProdeck/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../favorites.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Box<Favorite> favoriteBox;

  @override
  void initState() {
    super.initState();

    favoriteBox = Hive.box('favorite_box');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AtmTextHeading4(text: 'Favorite Cards'),
      ),
      body: ValueListenableBuilder(
        valueListenable: favoriteBox.listenable(),
        builder: (BuildContext context, Box<Favorite> value, Widget child) {
          print("VAL ${value.values.toList().length}");
          return value.values.toList().length == 0
              ? Center(
                  child: MolEmptyLayout(
                  icon: Icons.inbox,
                  desc: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Tap",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_border,
                          size: 24.0,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text(
                        "to add cards here",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ))
              : OrgCardFavoriteList(cards: value.values.toList());
        },
      ),
    );
  }
}
