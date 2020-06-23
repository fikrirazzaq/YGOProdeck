part of 'main_menu_bloc.dart';

enum MainMenuEvent { Home, Favorite }

@immutable
abstract class MainMenuState extends Equatable {
  MainMenuState();

  @override
  List<Object> get props => [];
}

class HomeMenu extends MainMenuState {
  final String title = "Home";
  final int itemIndex = 0;
}

class FavoriteMenu extends MainMenuState {
  final String title = "Favorite";
  final int itemIndex = 1;
}
