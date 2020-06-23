import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  @override
  MainMenuState get initialState => HomeMenu();

  @override
  Stream<MainMenuState> mapEventToState(MainMenuEvent event) async* {
    yield* _mapNavigateToState(event);
  }

  Stream<MainMenuState> _mapNavigateToState(MainMenuEvent event) async* {
    switch (event) {
      case MainMenuEvent.Home:
        yield HomeMenu();
        break;
      case MainMenuEvent.Favorite:
        yield FavoriteMenu();
        break;
      default:
        yield HomeMenu();
        break;
    }
  }
}
