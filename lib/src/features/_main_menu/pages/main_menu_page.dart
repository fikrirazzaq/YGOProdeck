import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../favorites/favorites.dart';
import '../../home/home.dart';
import '../main_menu.dart';

class MainMenuPage extends StatefulWidget {
  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  MainMenuBloc _mainMenuBloc;

  @override
  void initState() {
    super.initState();
    _mainMenuBloc = BlocProvider.of<MainMenuBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<MainMenuBloc, MainMenuState>(
        builder: (context, state) {
          if (state is HomeMenu) {
            return _buildMainMenu(state.itemIndex);
          }
          if (state is FavoriteMenu) {
            return _buildMainMenu(state.itemIndex);
          }
          return _buildMainMenu(0);
        },
      ),
    );
  }

  Scaffold _buildMainMenu(int currentIndex) {
    return Scaffold(
      body: _buildMainBody(currentIndex),
      bottomNavigationBar: BlocBuilder<MainMenuBloc, MainMenuState>(
        builder: (context, bottomNavState) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favorite'),
              ),
            ],
            onTap: (index) async {
              if (index == 0) _mainMenuBloc.add(MainMenuEvent.Home);
              if (index == 1) _mainMenuBloc.add(MainMenuEvent.Favorite);
            },
          );
        },
      ),
    );
  }

  _buildMainBody(int index) {
    switch (index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return FavoritePage();
        break;
    }
  }
}
